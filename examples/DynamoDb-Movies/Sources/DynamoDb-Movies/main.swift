//  Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0.

import DynamoDB
import ClientRuntime
import AWSClientRuntime
import Foundation

do {
    let tableName = "Movies"
    let credProvider = try AWSCredentialsProvider.fromProfile()
    let config = try DynamoDbClient.DynamoDbClientConfiguration(credentialsProvider: credProvider)
    let client = DynamoDbClient(config: config)
    createMoviesTable(client: client, name: tableName) { result in
        switch result {
        case .success(let tableCreating):
            if(tableCreating) {
                //wait for table to be created because waiters aren't implemented yet
                let tableReady = waitForTableToBeReady(client: client, name: tableName)
                if tableReady {
                    loadAndCheck(client: client, name: tableName)
                }
            } else {
               loadAndCheck(client: client, name: tableName)
            }
        case .failure(let err):
            print(err)
        }
    }
} catch let err {
    print(err)
}

func loadAndCheck(client: DynamoDbClient, name: String) {
    loadMoviesTable(client: client, name: name) { moviesLoaded in
        checkMovies(client: client, name: name)
    }
}

func checkMovies(client: DynamoDbClient, name: String) {
    getMoviesInYear(client: client, name: name, year: 2222) { result in
        switch result {
        case .success(let count):
            assert(count == 0)
        case .failure(let err):
            print(err)
        }
    }
    
    getMoviesInYear(client: client, name: name, year: 2013) { result in
        switch result {
        case .success(let count):
            assert(count == 2)
        case .failure(let err):
            print(err)
        }
    }
}



func waitForTableToBeReady(client: DynamoDbClient, name: String) -> Bool {
    let semaphore = DispatchSemaphore(value: 0)
    var ready = false
    while(!ready) {
        let request = DescribeTableInput(tableName: name)
        
        client.describeTable(input: request) { result in
            switch result {
            case .success(let resp):
                if resp.table?.tableStatus != .creating {
                    print("table is ready")
                    ready = true
                    semaphore.signal()
                    break
                }
            case .failure(let err):
                print(err)
                ready = false
                semaphore.signal()
                break
            }
        }
        print("waiting for table to be ready....")
        
    }
    semaphore.wait()
    return ready
}


func createMoviesTable(client: DynamoDbClient, name: String, completion: @escaping (Result<Bool, Error>) -> Void) {
    tableExists(client: client, name: name) { tableExists in
        if tableExists {
            completion(.success(true))
        } else {
            let request = CreateTableInput(attributeDefinitions: [AttributeDefinition(attributeName: "year", attributeType: .n),
                                                                  AttributeDefinition(attributeName: "title", attributeType: .s)],
                                           keySchema: [KeySchemaElement(attributeName: "year", keyType: .hash),
                                                       KeySchemaElement(attributeName: "title", keyType: .range)],
                                           provisionedThroughput: ProvisionedThroughput(readCapacityUnits: 10, writeCapacityUnits: 10),
                                           tableName: name)
            client.createTable(input: request) { result in
                switch result {
                case .success(let response):
                    print(response)
                    completion(.success(true))
                case .failure(let err):
                    print(err)
                    completion(.failure(err))
                }
            }
        }
    }
}

func tableExists(client: DynamoDbClient, name: String, completion: @escaping (Bool) -> Void) {
    client.listTables(input: ListTablesInput(limit: 10)) { result in
        switch result {
        case.success(let response):
            if let tableExists = response.tableNames?.contains(name), tableExists {
                completion(true)
            } else {
                completion(false)
            }
        case .failure(let err):
            print(err)
            completion(false)
        }
    }
}

func loadMoviesTable(client: DynamoDbClient, name: String, completion: @escaping (Result<Bool, Error>) -> Void) {
    if let url = Bundle.module.url(forResource: "data", withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601DateFormatterWithoutFractionalSeconds)
            
            let movies = try decoder.decode([Movie].self, from: data)
            var completions = 0
            for movie in movies {
                let request = PutItemInput(item: movie.toAttributeValues(), tableName: name)
                client.putItem(input: request) { result in
                    switch result {
                    case .success(let response):
                        print(response)
                        completions += 1
                        if completions == movies.count {
                            completion(.success(true))
                        }
                    case .failure(let err):
                        completion(.failure(err))
                    }
                }
            }
            
        } catch {
            print("error:\(error)")
            completion(.failure(error))
        }
    }
}

func getMoviesInYear(client: DynamoDbClient,
                     name: String,
                     year: Int,
                     completion: @escaping (Result<Int, SdkError<QueryOutputError>>) -> Void) {
    let query = QueryInput(expressionAttributeNames: ["#yr": "year"],
                           expressionAttributeValues: [":yyyy": .n(String(year))],
                           keyConditionExpression: "#yr = :yyyy",
                           tableName: name)
    client.query(input: query) { result in
        let movieResult: Result<Int, SdkError<QueryOutputError>> = result.map { resp in
            return resp.items?.count ?? 0
        }
        completion(movieResult)
    }
}
