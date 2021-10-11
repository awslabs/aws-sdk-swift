# LexModelsV2ClientProtocol

``` swift
public protocol LexModelsV2ClientProtocol 
```

## Requirements

### buildBotLocale(input:​completion:​)

Builds a bot, its intents, and its slot types into a specific
locale. A bot can be built into multiple locales. At runtime the locale
is used to choose a specific build of the bot.

``` swift
func buildBotLocale(input: BuildBotLocaleInput, completion: @escaping (ClientRuntime.SdkResult<BuildBotLocaleOutputResponse, BuildBotLocaleOutputError>) -> Void)
```

### createBot(input:​completion:​)

Creates an Amazon Lex conversational bot.

``` swift
func createBot(input: CreateBotInput, completion: @escaping (ClientRuntime.SdkResult<CreateBotOutputResponse, CreateBotOutputError>) -> Void)
```

### createBotAlias(input:​completion:​)

Creates an alias for the specified version of a bot. Use an alias to
enable you to change the version of a bot without updating applications
that use the bot.
For example, you can create an alias called "PROD" that your
applications use to call the Amazon Lex bot.

``` swift
func createBotAlias(input: CreateBotAliasInput, completion: @escaping (ClientRuntime.SdkResult<CreateBotAliasOutputResponse, CreateBotAliasOutputError>) -> Void)
```

### createBotLocale(input:​completion:​)

Creates a locale in the bot. The locale contains the intents and
slot types that the bot uses in conversations with users in the
specified language and locale. You must add a locale to a bot before
you can add intents and slot types to the bot.

``` swift
func createBotLocale(input: CreateBotLocaleInput, completion: @escaping (ClientRuntime.SdkResult<CreateBotLocaleOutputResponse, CreateBotLocaleOutputError>) -> Void)
```

### createBotVersion(input:​completion:​)

Creates a new version of the bot based on the DRAFT
version. If the DRAFT version of this resource hasn't
changed since you created the last version, Amazon Lex doesn't create a new
version, it returns the last created version.
When you create the first version of a bot, Amazon Lex sets the version
to 1. Subsequent versions increment by 1.

``` swift
func createBotVersion(input: CreateBotVersionInput, completion: @escaping (ClientRuntime.SdkResult<CreateBotVersionOutputResponse, CreateBotVersionOutputError>) -> Void)
```

### createExport(input:​completion:​)

Creates a zip archive containing the contents of a bot or a bot
locale. The archive contains a directory structure that contains JSON
files that define the bot.
You can create an archive that contains the complete definition of a
bot, or you can specify that the archive contain only the definition of
a single bot locale.
For more information about exporting bots, and about the structure
of the export archive, see <a href="https:​//docs.aws.amazon.com/lexv2/latest/dg/importing-exporting.html"> Importing and
exporting bots

``` swift
func createExport(input: CreateExportInput, completion: @escaping (ClientRuntime.SdkResult<CreateExportOutputResponse, CreateExportOutputError>) -> Void)
```

### createIntent(input:​completion:​)

Creates an intent.
To define the interaction between the user and your bot, you define
one or more intents. For example, for a pizza ordering bot you would
create an OrderPizza intent.
When you create an intent, you must provide a name. You can
optionally provide the following:​

``` swift
func createIntent(input: CreateIntentInput, completion: @escaping (ClientRuntime.SdkResult<CreateIntentOutputResponse, CreateIntentOutputError>) -> Void)
```

``` 
           Sample utterances. For example, "I want to order a pizza" and
           "Can I order a pizza." You can't provide utterances for built-in
           intents.


           Information to be gathered. You specify slots for the
           information that you bot requests from the user. You can specify
           standard slot types, such as date and time, or custom slot types
           for your application.


           How the intent is fulfilled. You can provide a Lambda function
           or configure the intent to return the intent information to your
           client application. If you use a Lambda function, Amazon Lex invokes
           the function when all of the intent information is
           available.


           A confirmation prompt to send to the user to confirm an
           intent. For example, "Shall I order your pizza?"


           A conclusion statement to send to the user after the intent is
           fulfilled. For example, "I ordered your pizza."


           A follow-up prompt that asks the user for additional activity.
           For example, "Do you want a drink with your pizza?"
```

### createResourcePolicy(input:​completion:​)

Creates a new resource policy with the specified policy
statements.

``` swift
func createResourcePolicy(input: CreateResourcePolicyInput, completion: @escaping (ClientRuntime.SdkResult<CreateResourcePolicyOutputResponse, CreateResourcePolicyOutputError>) -> Void)
```

### createResourcePolicyStatement(input:​completion:​)

Adds a new resource policy statement to a bot or bot alias. If a
resource policy exists, the statement is added to the current resource
policy. If a policy doesn't exist, a new policy is created.
You can't create a resource policy statement that allows
cross-account access.

``` swift
func createResourcePolicyStatement(input: CreateResourcePolicyStatementInput, completion: @escaping (ClientRuntime.SdkResult<CreateResourcePolicyStatementOutputResponse, CreateResourcePolicyStatementOutputError>) -> Void)
```

### createSlot(input:​completion:​)

Creates a slot in an intent. A slot is a variable needed to fulfill
an intent. For example, an OrderPizza intent might need
slots for size, crust, and number of pizzas. For each slot, you define
one or more utterances that Amazon Lex uses to elicit a response from the
user.

``` swift
func createSlot(input: CreateSlotInput, completion: @escaping (ClientRuntime.SdkResult<CreateSlotOutputResponse, CreateSlotOutputError>) -> Void)
```

### createSlotType(input:​completion:​)

Creates a custom slot type
To create a custom slot type, specify a name for the slot type and
a set of enumeration values, the values that a slot of this type can
assume.

``` swift
func createSlotType(input: CreateSlotTypeInput, completion: @escaping (ClientRuntime.SdkResult<CreateSlotTypeOutputResponse, CreateSlotTypeOutputError>) -> Void)
```

### createUploadUrl(input:​completion:​)

Gets a pre-signed S3 write URL that you use to upload the zip
archive when importing a bot or a bot locale.

``` swift
func createUploadUrl(input: CreateUploadUrlInput, completion: @escaping (ClientRuntime.SdkResult<CreateUploadUrlOutputResponse, CreateUploadUrlOutputError>) -> Void)
```

### deleteBot(input:​completion:​)

Deletes all versions of a bot, including the Draft
version. To delete a specific version, use the
DeleteBotVersion operation.
When you delete a bot, all of the resources contained in the bot are
also deleted. Deleting a bot removes all locales, intents, slot, and
slot types defined for the bot.
If a bot has an alias, the DeleteBot operation returns
a ResourceInUseException exception. If you want to delete
the bot and the alias, set the skipResourceInUseCheck
parameter to true.

``` swift
func deleteBot(input: DeleteBotInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBotOutputResponse, DeleteBotOutputError>) -> Void)
```

### deleteBotAlias(input:​completion:​)

Deletes the specified bot alias.

``` swift
func deleteBotAlias(input: DeleteBotAliasInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBotAliasOutputResponse, DeleteBotAliasOutputError>) -> Void)
```

### deleteBotLocale(input:​completion:​)

Removes a locale from a bot.
When you delete a locale, all intents, slots, and slot types defined
for the locale are also deleted.

``` swift
func deleteBotLocale(input: DeleteBotLocaleInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBotLocaleOutputResponse, DeleteBotLocaleOutputError>) -> Void)
```

### deleteBotVersion(input:​completion:​)

Deletes a specific version of a bot. To delete all version of a bot,
use the DeleteBot operation.

``` swift
func deleteBotVersion(input: DeleteBotVersionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBotVersionOutputResponse, DeleteBotVersionOutputError>) -> Void)
```

### deleteExport(input:​completion:​)

Removes a previous export and the associated files stored in an S3
bucket.

``` swift
func deleteExport(input: DeleteExportInput, completion: @escaping (ClientRuntime.SdkResult<DeleteExportOutputResponse, DeleteExportOutputError>) -> Void)
```

### deleteImport(input:​completion:​)

Removes a previous import and the associated file stored in an S3
bucket.

``` swift
func deleteImport(input: DeleteImportInput, completion: @escaping (ClientRuntime.SdkResult<DeleteImportOutputResponse, DeleteImportOutputError>) -> Void)
```

### deleteIntent(input:​completion:​)

Removes the specified intent.
Deleting an intent also deletes the slots associated with the
intent.

``` swift
func deleteIntent(input: DeleteIntentInput, completion: @escaping (ClientRuntime.SdkResult<DeleteIntentOutputResponse, DeleteIntentOutputError>) -> Void)
```

### deleteResourcePolicy(input:​completion:​)

Removes an existing policy from a bot or bot alias. If the resource
doesn't have a policy attached, Amazon Lex returns an exception.

``` swift
func deleteResourcePolicy(input: DeleteResourcePolicyInput, completion: @escaping (ClientRuntime.SdkResult<DeleteResourcePolicyOutputResponse, DeleteResourcePolicyOutputError>) -> Void)
```

### deleteResourcePolicyStatement(input:​completion:​)

Deletes a policy statement from a resource policy. If you delete the
last statement from a policy, the policy is deleted. If you specify a
statement ID that doesn't exist in the policy, or if the bot or bot
alias doesn't have a policy attached, Amazon Lex returns an
exception.

``` swift
func deleteResourcePolicyStatement(input: DeleteResourcePolicyStatementInput, completion: @escaping (ClientRuntime.SdkResult<DeleteResourcePolicyStatementOutputResponse, DeleteResourcePolicyStatementOutputError>) -> Void)
```

### deleteSlot(input:​completion:​)

Deletes the specified slot from an intent.

``` swift
func deleteSlot(input: DeleteSlotInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSlotOutputResponse, DeleteSlotOutputError>) -> Void)
```

### deleteSlotType(input:​completion:​)

Deletes a slot type from a bot locale.
If a slot is using the slot type, Amazon Lex throws a
ResourceInUseException exception. To avoid the
exception, set the skipResourceInUseCheck parameter to
true.

``` swift
func deleteSlotType(input: DeleteSlotTypeInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSlotTypeOutputResponse, DeleteSlotTypeOutputError>) -> Void)
```

### deleteUtterances(input:​completion:​)

Deletes stored utterances.
Amazon Lex stores the utterances that users send to your bot. Utterances
are stored for 15 days for use with the  operation, and then stored
indefinitely for use in improving the ability of your bot to respond to
user input..
Use the DeleteUtterances operation to manually delete
utterances for a specific session. When you use the
DeleteUtterances operation, utterances stored for
improving your bot's ability to respond to user input are deleted
immediately. Utterances stored for use with the
ListAggregatedUtterances operation are deleted after 15
days.

``` swift
func deleteUtterances(input: DeleteUtterancesInput, completion: @escaping (ClientRuntime.SdkResult<DeleteUtterancesOutputResponse, DeleteUtterancesOutputError>) -> Void)
```

### describeBot(input:​completion:​)

Provides metadata information about a bot.

``` swift
func describeBot(input: DescribeBotInput, completion: @escaping (ClientRuntime.SdkResult<DescribeBotOutputResponse, DescribeBotOutputError>) -> Void)
```

### describeBotAlias(input:​completion:​)

Get information about a specific bot alias.

``` swift
func describeBotAlias(input: DescribeBotAliasInput, completion: @escaping (ClientRuntime.SdkResult<DescribeBotAliasOutputResponse, DescribeBotAliasOutputError>) -> Void)
```

### describeBotLocale(input:​completion:​)

Describes the settings that a bot has for a specific locale.

``` swift
func describeBotLocale(input: DescribeBotLocaleInput, completion: @escaping (ClientRuntime.SdkResult<DescribeBotLocaleOutputResponse, DescribeBotLocaleOutputError>) -> Void)
```

### describeBotVersion(input:​completion:​)

Provides metadata about a version of a bot.

``` swift
func describeBotVersion(input: DescribeBotVersionInput, completion: @escaping (ClientRuntime.SdkResult<DescribeBotVersionOutputResponse, DescribeBotVersionOutputError>) -> Void)
```

### describeExport(input:​completion:​)

Gets information about a specific export.

``` swift
func describeExport(input: DescribeExportInput, completion: @escaping (ClientRuntime.SdkResult<DescribeExportOutputResponse, DescribeExportOutputError>) -> Void)
```

### describeImport(input:​completion:​)

Gets information about a specific import.

``` swift
func describeImport(input: DescribeImportInput, completion: @escaping (ClientRuntime.SdkResult<DescribeImportOutputResponse, DescribeImportOutputError>) -> Void)
```

### describeIntent(input:​completion:​)

Returns metadata about an intent.

``` swift
func describeIntent(input: DescribeIntentInput, completion: @escaping (ClientRuntime.SdkResult<DescribeIntentOutputResponse, DescribeIntentOutputError>) -> Void)
```

### describeResourcePolicy(input:​completion:​)

Gets the resource policy and policy revision for a bot or bot
alias.

``` swift
func describeResourcePolicy(input: DescribeResourcePolicyInput, completion: @escaping (ClientRuntime.SdkResult<DescribeResourcePolicyOutputResponse, DescribeResourcePolicyOutputError>) -> Void)
```

### describeSlot(input:​completion:​)

Gets metadata information about a slot.

``` swift
func describeSlot(input: DescribeSlotInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSlotOutputResponse, DescribeSlotOutputError>) -> Void)
```

### describeSlotType(input:​completion:​)

Gets metadata information about a slot type.

``` swift
func describeSlotType(input: DescribeSlotTypeInput, completion: @escaping (ClientRuntime.SdkResult<DescribeSlotTypeOutputResponse, DescribeSlotTypeOutputError>) -> Void)
```

### listAggregatedUtterances(input:​completion:​)

Provides a list of utterances that users have sent to the
bot.
Utterances are aggregated by the text of the utterance. For example,
all instances where customers used the phrase "I want to order pizza"
are aggregated into the same line in the response.
You can see both detected utterances and missed utterances. A
detected utterance is where the bot properly recognized the utterance
and activated the associated intent. A missed utterance was not
recognized by the bot and didn't activate an intent.
Utterances can be aggregated for a bot alias or for a bot version,
but not both at the same time.
Utterances statistics are not generated under the following
conditions:​

``` swift
func listAggregatedUtterances(input: ListAggregatedUtterancesInput, completion: @escaping (ClientRuntime.SdkResult<ListAggregatedUtterancesOutputResponse, ListAggregatedUtterancesOutputError>) -> Void)
```

``` 
           The childDirected field was set to true when the
           bot was created.


           You are using slot obfuscation with one or more slots.


           You opted out of participating in improving Amazon Lex.
```

### listBotAliases(input:​completion:​)

Gets a list of aliases for the specified bot.

``` swift
func listBotAliases(input: ListBotAliasesInput, completion: @escaping (ClientRuntime.SdkResult<ListBotAliasesOutputResponse, ListBotAliasesOutputError>) -> Void)
```

### listBotLocales(input:​completion:​)

Gets a list of locales for the specified bot.

``` swift
func listBotLocales(input: ListBotLocalesInput, completion: @escaping (ClientRuntime.SdkResult<ListBotLocalesOutputResponse, ListBotLocalesOutputError>) -> Void)
```

### listBots(input:​completion:​)

Gets a list of available bots.

``` swift
func listBots(input: ListBotsInput, completion: @escaping (ClientRuntime.SdkResult<ListBotsOutputResponse, ListBotsOutputError>) -> Void)
```

### listBotVersions(input:​completion:​)

Gets information about all of the versions of a bot.
The ListBotVersions operation returns a summary of each
version of a bot. For example, if a bot has three numbered versions,
the ListBotVersions operation returns for summaries, one
for each numbered version and one for the DRAFT
version.
The ListBotVersions operation always returns at least
one version, the DRAFT version.

``` swift
func listBotVersions(input: ListBotVersionsInput, completion: @escaping (ClientRuntime.SdkResult<ListBotVersionsOutputResponse, ListBotVersionsOutputError>) -> Void)
```

### listBuiltInIntents(input:​completion:​)

Gets a list of built-in intents provided by Amazon Lex that you can use
in your bot.
To use a built-in intent as a the base for your own intent, include
the built-in intent signature in the parentIntentSignature
parameter when you call the CreateIntent operation. For
more information, see CreateIntent.

``` swift
func listBuiltInIntents(input: ListBuiltInIntentsInput, completion: @escaping (ClientRuntime.SdkResult<ListBuiltInIntentsOutputResponse, ListBuiltInIntentsOutputError>) -> Void)
```

### listBuiltInSlotTypes(input:​completion:​)

Gets a list of built-in slot types that meet the specified
criteria.

``` swift
func listBuiltInSlotTypes(input: ListBuiltInSlotTypesInput, completion: @escaping (ClientRuntime.SdkResult<ListBuiltInSlotTypesOutputResponse, ListBuiltInSlotTypesOutputError>) -> Void)
```

### listExports(input:​completion:​)

Lists the exports for a bot or bot locale. Exports are kept in the
list for 7 days.

``` swift
func listExports(input: ListExportsInput, completion: @escaping (ClientRuntime.SdkResult<ListExportsOutputResponse, ListExportsOutputError>) -> Void)
```

### listImports(input:​completion:​)

Lists the imports for a bot or bot locale. Imports are kept in the
list for 7 days.

``` swift
func listImports(input: ListImportsInput, completion: @escaping (ClientRuntime.SdkResult<ListImportsOutputResponse, ListImportsOutputError>) -> Void)
```

### listIntents(input:​completion:​)

Get a list of intents that meet the specified criteria.

``` swift
func listIntents(input: ListIntentsInput, completion: @escaping (ClientRuntime.SdkResult<ListIntentsOutputResponse, ListIntentsOutputError>) -> Void)
```

### listSlots(input:​completion:​)

Gets a list of slots that match the specified criteria.

``` swift
func listSlots(input: ListSlotsInput, completion: @escaping (ClientRuntime.SdkResult<ListSlotsOutputResponse, ListSlotsOutputError>) -> Void)
```

### listSlotTypes(input:​completion:​)

Gets a list of slot types that match the specified criteria.

``` swift
func listSlotTypes(input: ListSlotTypesInput, completion: @escaping (ClientRuntime.SdkResult<ListSlotTypesOutputResponse, ListSlotTypesOutputError>) -> Void)
```

### listTagsForResource(input:​completion:​)

Gets a list of tags associated with a resource. Only bots, bot
aliases, and bot channels can have tags associated with them.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### startImport(input:​completion:​)

Starts importing a bot or bot locale from a zip archive that you
uploaded to an S3 bucket.

``` swift
func startImport(input: StartImportInput, completion: @escaping (ClientRuntime.SdkResult<StartImportOutputResponse, StartImportOutputError>) -> Void)
```

### tagResource(input:​completion:​)

Adds the specified tags to the specified resource. If a tag key
already exists, the existing value is replaced with the new
value.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:​completion:​)

Removes tags from a bot, bot alias, or bot channel.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```

### updateBot(input:​completion:​)

Updates the configuration of an existing bot.

``` swift
func updateBot(input: UpdateBotInput, completion: @escaping (ClientRuntime.SdkResult<UpdateBotOutputResponse, UpdateBotOutputError>) -> Void)
```

### updateBotAlias(input:​completion:​)

Updates the configuration of an existing bot alias.

``` swift
func updateBotAlias(input: UpdateBotAliasInput, completion: @escaping (ClientRuntime.SdkResult<UpdateBotAliasOutputResponse, UpdateBotAliasOutputError>) -> Void)
```

### updateBotLocale(input:​completion:​)

Updates the settings that a bot has for a specific locale.

``` swift
func updateBotLocale(input: UpdateBotLocaleInput, completion: @escaping (ClientRuntime.SdkResult<UpdateBotLocaleOutputResponse, UpdateBotLocaleOutputError>) -> Void)
```

### updateExport(input:​completion:​)

Updates the password used to protect an export zip archive.
The password is not required. If you don't supply a password, Amazon Lex
generates a zip file that is not protected by a password. This is the
archive that is available at the pre-signed S3 URL provided by the
operation.

``` swift
func updateExport(input: UpdateExportInput, completion: @escaping (ClientRuntime.SdkResult<UpdateExportOutputResponse, UpdateExportOutputError>) -> Void)
```

### updateIntent(input:​completion:​)

Updates the settings for an intent.

``` swift
func updateIntent(input: UpdateIntentInput, completion: @escaping (ClientRuntime.SdkResult<UpdateIntentOutputResponse, UpdateIntentOutputError>) -> Void)
```

### updateResourcePolicy(input:​completion:​)

Replaces the existing resource policy for a bot or bot alias with a
new one. If the policy doesn't exist, Amazon Lex returns an
exception.

``` swift
func updateResourcePolicy(input: UpdateResourcePolicyInput, completion: @escaping (ClientRuntime.SdkResult<UpdateResourcePolicyOutputResponse, UpdateResourcePolicyOutputError>) -> Void)
```

### updateSlot(input:​completion:​)

Updates the settings for a slot.

``` swift
func updateSlot(input: UpdateSlotInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSlotOutputResponse, UpdateSlotOutputError>) -> Void)
```

### updateSlotType(input:​completion:​)

Updates the configuration of an existing slot type.

``` swift
func updateSlotType(input: UpdateSlotTypeInput, completion: @escaping (ClientRuntime.SdkResult<UpdateSlotTypeOutputResponse, UpdateSlotTypeOutputError>) -> Void)
```
