import DynamoDB
import Darwin
import AWSClientRuntime

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
                waitForTableToBeReady(client: client, name: tableName) { result in
                    switch result {
                    case .success(let tableReady):
                        if tableReady {
                            loadMoviesTable(client: client, name: tableName) { moviesLoaded in
                                print("movies loaded")
                            }
                        }
                    case .failure(let err):
                        print(err)
                    }

                }
            }
        case .failure(let err):
            print(err)
        }

        
    }
}



func waitForTableToBeReady(client: DynamoDbClient, name: String, completion: @escaping (Result<Bool, Error>) -> Void) {
    while(true) {
        let request = DescribeTableInput(tableName: name)
        client.describeTable(input: request) { result in
            switch result {
            case .success(let resp):
                if resp.table?.tableStatus != .creating {
                    print("table is ready")
                    completion(.success(true))
                }
            case .failure(let err):
                print(err)
                completion(.failure(err))
            }
        }
        print("waiting for table to be ready....")
        sleep(1000)
    }
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

func loadMoviesTable(client: DynamoDbClient, name: String, completion: (Result<Bool, Error>) -> Void) {
    
}
