# IotEventsDataClient

``` swift
public class IotEventsDataClient 
```

## Inheritance

[`IotEventsDataClientProtocol`](/aws-sdk-swift/reference/0.x/AWSIoTEventsData/IotEventsDataClientProtocol)

## Initializers

### `init(config:)`

``` swift
public init(config: AWSClientRuntime.AWSClientConfiguration) 
```

### `init(region:)`

``` swift
public convenience init(region: Swift.String? = nil) throws 
```

## Methods

### `batchAcknowledgeAlarm(input:completion:)`

Acknowledges one or more alarms. The alarms change to the ACKNOWLEDGED state
after you acknowledge them.

``` swift
public func batchAcknowledgeAlarm(input: BatchAcknowledgeAlarmInput, completion: @escaping (ClientRuntime.SdkResult<BatchAcknowledgeAlarmOutputResponse, BatchAcknowledgeAlarmOutputError>) -> Void)
```

### `batchDisableAlarm(input:completion:)`

Disables one or more alarms. The alarms change to the DISABLED state after
you disable them.

``` swift
public func batchDisableAlarm(input: BatchDisableAlarmInput, completion: @escaping (ClientRuntime.SdkResult<BatchDisableAlarmOutputResponse, BatchDisableAlarmOutputError>) -> Void)
```

### `batchEnableAlarm(input:completion:)`

Enables one or more alarms. The alarms change to the NORMAL state after you
enable them.

``` swift
public func batchEnableAlarm(input: BatchEnableAlarmInput, completion: @escaping (ClientRuntime.SdkResult<BatchEnableAlarmOutputResponse, BatchEnableAlarmOutputError>) -> Void)
```

### `batchPutMessage(input:completion:)`

Sends a set of messages to the AWS IoT Events system. Each message payload is transformed into
the input you specify ("inputName") and ingested into any detectors that monitor
that input. If multiple messages are sent, the order in which the messages are processed isn't
guaranteed. To guarantee ordering, you must send messages one at a time and wait for a
successful response.

``` swift
public func batchPutMessage(input: BatchPutMessageInput, completion: @escaping (ClientRuntime.SdkResult<BatchPutMessageOutputResponse, BatchPutMessageOutputError>) -> Void)
```

### `batchResetAlarm(input:completion:)`

Resets one or more alarms. The alarms return to the NORMAL state after you
reset them.

``` swift
public func batchResetAlarm(input: BatchResetAlarmInput, completion: @escaping (ClientRuntime.SdkResult<BatchResetAlarmOutputResponse, BatchResetAlarmOutputError>) -> Void)
```

### `batchSnoozeAlarm(input:completion:)`

Changes one or more alarms to the snooze mode. The alarms change to the
SNOOZE\_DISABLED state after you set them to the snooze mode.

``` swift
public func batchSnoozeAlarm(input: BatchSnoozeAlarmInput, completion: @escaping (ClientRuntime.SdkResult<BatchSnoozeAlarmOutputResponse, BatchSnoozeAlarmOutputError>) -> Void)
```

### `batchUpdateDetector(input:completion:)`

Updates the state, variable values, and timer settings of one or more detectors
(instances) of a specified detector model.

``` swift
public func batchUpdateDetector(input: BatchUpdateDetectorInput, completion: @escaping (ClientRuntime.SdkResult<BatchUpdateDetectorOutputResponse, BatchUpdateDetectorOutputError>) -> Void)
```

### `describeAlarm(input:completion:)`

Retrieves information about an alarm.

``` swift
public func describeAlarm(input: DescribeAlarmInput, completion: @escaping (ClientRuntime.SdkResult<DescribeAlarmOutputResponse, DescribeAlarmOutputError>) -> Void)
```

### `describeDetector(input:completion:)`

Returns information about the specified detector (instance).

``` swift
public func describeDetector(input: DescribeDetectorInput, completion: @escaping (ClientRuntime.SdkResult<DescribeDetectorOutputResponse, DescribeDetectorOutputError>) -> Void)
```

### `listAlarms(input:completion:)`

Lists one or more alarms. The operation returns only the metadata associated with each
alarm.

``` swift
public func listAlarms(input: ListAlarmsInput, completion: @escaping (ClientRuntime.SdkResult<ListAlarmsOutputResponse, ListAlarmsOutputError>) -> Void)
```

### `listDetectors(input:completion:)`

Lists detectors (the instances of a detector model).

``` swift
public func listDetectors(input: ListDetectorsInput, completion: @escaping (ClientRuntime.SdkResult<ListDetectorsOutputResponse, ListDetectorsOutputError>) -> Void)
```
