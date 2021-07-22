import DynamoDB
import Darwin
import AWSClientRuntime
import Foundation

do {
    let tableName = "Movies"
    let credProvider = try AWSCredentialsProvider.fromProfile()
    let config = try DynamoDbClient.DynamoDbClientConfiguration(credentialsProvider: credProvider)
    let client = DynamoDbClient(config: config)
    loadMoviesTable(client: client, name: tableName) { moviesLoaded in
        print("movies loaded")
    }
//    createMoviesTable(client: client, name: tableName) { result in
//        switch result {
//        case .success(let tableCreating):
//            if(tableCreating) {
//                //wait for table to be created because waiters aren't implemented yet
//                let tableReady = waitForTableToBeReady(client: client, name: tableName)
//                if tableReady {
//                    loadMoviesTable(client: client, name: tableName) { moviesLoaded in
//                        print("movies loaded")
//                    }
//                }
//            } else {
//                loadMoviesTable(client: client, name: tableName) { moviesLoaded in
//                    print("movies loaded")
//                }
//            }
//        case .failure(let err):
//            print(err)
//        }
//    }
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
    client.listTables(input: ListTablesInput()) { result in
        switch result {
        case.success(let response):
            completion(response.tableNames?.contains(name) ?? false)
        case .failure:
            completion(false)
        }
    }
}

func loadMoviesTable(client: DynamoDbClient, name: String, completion: @escaping (Result<Bool, Error>) -> Void) {
    if let url = Bundle.main.url(forResource: "Resources/data", withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            
            
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

