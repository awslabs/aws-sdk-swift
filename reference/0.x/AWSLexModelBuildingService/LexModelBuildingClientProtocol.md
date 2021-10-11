# LexModelBuildingClientProtocol

<fullname>Amazon Lex Build-Time Actions</fullname>
Amazon Lex is an AWS service for building conversational voice and text
interfaces. Use these actions to create, update, and delete conversational
bots for new and existing client applications.

``` swift
public protocol LexModelBuildingClientProtocol 
```

## Requirements

### createBotVersion(input:​completion:​)

Creates a new version of the bot based on the $LATEST
version. If the $LATEST version of this resource hasn't
changed since you created the last version, Amazon Lex doesn't create a new
version. It returns the last created version.

``` swift
func createBotVersion(input: CreateBotVersionInput, completion: @escaping (ClientRuntime.SdkResult<CreateBotVersionOutputResponse, CreateBotVersionOutputError>) -> Void)
```

``` 
        You can update only the $LATEST version of the bot.
    You can't update the numbered versions that you create with the
      CreateBotVersion operation.

      When you create the first version of a bot, Amazon Lex sets the version
  to 1. Subsequent versions increment by 1. For more information, see versioning-intro.
      This operation requires permission for the
    lex:CreateBotVersion action.
```

### createIntentVersion(input:​completion:​)

Creates a new version of an intent based on the
$LATEST version of the intent. If the $LATEST
version of this intent hasn't changed since you last updated it, Amazon Lex
doesn't create a new version. It returns the last version you
created.

``` swift
func createIntentVersion(input: CreateIntentVersionInput, completion: @escaping (ClientRuntime.SdkResult<CreateIntentVersionOutputResponse, CreateIntentVersionOutputError>) -> Void)
```

``` 
        You can update only the $LATEST version of the
    intent. You can't update the numbered versions that you create with the
      CreateIntentVersion operation.

      When you create a version of an intent, Amazon Lex sets the version to
  1. Subsequent versions increment by 1. For more information, see versioning-intro.
     This operation requires permissions to perform the
    lex:CreateIntentVersion action.
```

### createSlotTypeVersion(input:​completion:​)

Creates a new version of a slot type based on the
$LATEST version of the specified slot type. If the
$LATEST version of this resource has not changed since the
last version that you created, Amazon Lex doesn't create a new version. It
returns the last version that you created.

``` swift
func createSlotTypeVersion(input: CreateSlotTypeVersionInput, completion: @escaping (ClientRuntime.SdkResult<CreateSlotTypeVersionOutputResponse, CreateSlotTypeVersionOutputError>) -> Void)
```

``` 
        You can update only the $LATEST version of a slot
    type. You can't update the numbered versions that you create with the
      CreateSlotTypeVersion operation.


     When you create a version of a slot type, Amazon Lex sets the version to
  1. Subsequent versions increment by 1. For more information, see versioning-intro.

     This operation requires permissions for the
    lex:CreateSlotTypeVersion action.
```

### deleteBot(input:​completion:​)

Deletes all versions of the bot, including the $LATEST
version. To delete a specific version of the bot, use the DeleteBotVersion operation. The DeleteBot
operation doesn't immediately remove the bot schema. Instead, it is marked
for deletion and removed later.
Amazon Lex stores utterances indefinitely for improving the ability of
your bot to respond to user inputs. These utterances are not removed when
the bot is deleted. To remove the utterances, use the DeleteUtterances operation.
If a bot has an alias, you can't delete it. Instead, the
DeleteBot operation returns a
ResourceInUseException exception that includes a reference
to the alias that refers to the bot. To remove the reference to the bot,
delete the alias. If you get the same exception again, delete the
referring alias until the DeleteBot operation is
successful.

``` swift
func deleteBot(input: DeleteBotInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBotOutputResponse, DeleteBotOutputError>) -> Void)
```

``` 
     This operation requires permissions for the
    lex:DeleteBot action.
```

### deleteBotAlias(input:​completion:​)

Deletes an alias for the specified bot.
You can't delete an alias that is used in the association between a
bot and a messaging channel. If an alias is used in a channel association,
the DeleteBot operation returns a
ResourceInUseException exception that includes a reference
to the channel association that refers to the bot. You can remove the
reference to the alias by deleting the channel association. If you get the
same exception again, delete the referring association until the
DeleteBotAlias operation is successful.

``` swift
func deleteBotAlias(input: DeleteBotAliasInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBotAliasOutputResponse, DeleteBotAliasOutputError>) -> Void)
```

### deleteBotChannelAssociation(input:​completion:​)

Deletes the association between an Amazon Lex bot and a messaging
platform.
This operation requires permission for the
lex:​DeleteBotChannelAssociation action.

``` swift
func deleteBotChannelAssociation(input: DeleteBotChannelAssociationInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBotChannelAssociationOutputResponse, DeleteBotChannelAssociationOutputError>) -> Void)
```

### deleteBotVersion(input:​completion:​)

Deletes a specific version of a bot. To delete all versions of a
bot, use the DeleteBot operation.
This operation requires permissions for the
lex:​DeleteBotVersion action.

``` swift
func deleteBotVersion(input: DeleteBotVersionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteBotVersionOutputResponse, DeleteBotVersionOutputError>) -> Void)
```

### deleteIntent(input:​completion:​)

Deletes all versions of the intent, including the
$LATEST version. To delete a specific version of the
intent, use the DeleteIntentVersion operation.
You can delete a version of an intent only if it is not
referenced. To delete an intent that is referred to in one or more bots
(see how-it-works), you must remove those references
first.

``` swift
func deleteIntent(input: DeleteIntentInput, completion: @escaping (ClientRuntime.SdkResult<DeleteIntentOutputResponse, DeleteIntentOutputError>) -> Void)
```

``` 
         If you get the ResourceInUseException exception, it
    provides an example reference that shows where the intent is referenced.
    To remove the reference to the intent, either update the bot or delete
    it. If you get the same exception when you attempt to delete the intent
    again, repeat until the intent has no references and the call to
      DeleteIntent is successful.


      This operation requires permission for the
    lex:DeleteIntent action.
```

### deleteIntentVersion(input:​completion:​)

Deletes a specific version of an intent. To delete all versions of
a intent, use the DeleteIntent operation.
This operation requires permissions for the
lex:​DeleteIntentVersion action.

``` swift
func deleteIntentVersion(input: DeleteIntentVersionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteIntentVersionOutputResponse, DeleteIntentVersionOutputError>) -> Void)
```

### deleteSlotType(input:​completion:​)

Deletes all versions of the slot type, including the
$LATEST version. To delete a specific version of the slot
type, use the DeleteSlotTypeVersion operation.
You can delete a version of a slot type only if it is not
referenced. To delete a slot type that is referred to in one or more
intents, you must remove those references first.

``` swift
func deleteSlotType(input: DeleteSlotTypeInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSlotTypeOutputResponse, DeleteSlotTypeOutputError>) -> Void)
```

``` 
         If you get the ResourceInUseException exception,
    the exception provides an example reference that shows the intent where
    the slot type is referenced. To remove the reference to the slot type,
    either update the intent or delete it. If you get the same exception
    when you attempt to delete the slot type again, repeat until the slot
    type has no references and the DeleteSlotType call is
    successful.

     This operation requires permission for the
    lex:DeleteSlotType action.
```

### deleteSlotTypeVersion(input:​completion:​)

Deletes a specific version of a slot type. To delete all versions
of a slot type, use the DeleteSlotType operation.
This operation requires permissions for the
lex:​DeleteSlotTypeVersion action.

``` swift
func deleteSlotTypeVersion(input: DeleteSlotTypeVersionInput, completion: @escaping (ClientRuntime.SdkResult<DeleteSlotTypeVersionOutputResponse, DeleteSlotTypeVersionOutputError>) -> Void)
```

### deleteUtterances(input:​completion:​)

Deletes stored utterances.
Amazon Lex stores the utterances that users send to your bot. Utterances
are stored for 15 days for use with the GetUtterancesView operation, and then stored indefinitely for use in improving the
ability of your bot to respond to user input.
Use the DeleteUtterances operation to manually delete
stored utterances for a specific user. When you use the
DeleteUtterances operation, utterances stored for improving
your bot's ability to respond to user input are deleted immediately.
Utterances stored for use with the GetUtterancesView
operation are deleted after 15 days.
This operation requires permissions for the
lex:​DeleteUtterances action.

``` swift
func deleteUtterances(input: DeleteUtterancesInput, completion: @escaping (ClientRuntime.SdkResult<DeleteUtterancesOutputResponse, DeleteUtterancesOutputError>) -> Void)
```

### getBot(input:​completion:​)

Returns metadata information for a specific bot. You must provide
the bot name and the bot version or alias.
This operation requires permissions for the
lex:​GetBot action.

``` swift
func getBot(input: GetBotInput, completion: @escaping (ClientRuntime.SdkResult<GetBotOutputResponse, GetBotOutputError>) -> Void)
```

### getBotAlias(input:​completion:​)

Returns information about an Amazon Lex bot alias. For more information
about aliases, see versioning-aliases.
This operation requires permissions for the
lex:​GetBotAlias action.

``` swift
func getBotAlias(input: GetBotAliasInput, completion: @escaping (ClientRuntime.SdkResult<GetBotAliasOutputResponse, GetBotAliasOutputError>) -> Void)
```

### getBotAliases(input:​completion:​)

Returns a list of aliases for a specified Amazon Lex bot.
This operation requires permissions for the
lex:​GetBotAliases action.

``` swift
func getBotAliases(input: GetBotAliasesInput, completion: @escaping (ClientRuntime.SdkResult<GetBotAliasesOutputResponse, GetBotAliasesOutputError>) -> Void)
```

### getBotChannelAssociation(input:​completion:​)

Returns information about the association between an Amazon Lex bot and
a messaging platform.
This operation requires permissions for the
lex:​GetBotChannelAssociation action.

``` swift
func getBotChannelAssociation(input: GetBotChannelAssociationInput, completion: @escaping (ClientRuntime.SdkResult<GetBotChannelAssociationOutputResponse, GetBotChannelAssociationOutputError>) -> Void)
```

### getBotChannelAssociations(input:​completion:​)

Returns a list of all of the channels associated with the
specified bot.
The GetBotChannelAssociations operation requires
permissions for the lex:​GetBotChannelAssociations
action.

``` swift
func getBotChannelAssociations(input: GetBotChannelAssociationsInput, completion: @escaping (ClientRuntime.SdkResult<GetBotChannelAssociationsOutputResponse, GetBotChannelAssociationsOutputError>) -> Void)
```

### getBots(input:​completion:​)

Returns bot information as follows:​

``` swift
func getBots(input: GetBotsInput, completion: @escaping (ClientRuntime.SdkResult<GetBotsOutputResponse, GetBotsOutputError>) -> Void)
```

``` 
           If you provide the nameContains field, the
      response includes information for the $LATEST version of
      all bots whose name contains the specified string.


           If you don't specify the nameContains field, the
      operation returns information about the $LATEST version
      of all of your bots.


     This operation requires permission for the lex:GetBots
  action.
```

### getBotVersions(input:​completion:​)

Gets information about all of the versions of a bot.
The GetBotVersions operation returns a
BotMetadata object for each version of a bot. For example,
if a bot has three numbered versions, the GetBotVersions
operation returns four BotMetadata objects in the response,
one for each numbered version and one for the $LATEST
version.
The GetBotVersions operation always returns at least
one version, the $LATEST version.
This operation requires permissions for the
lex:​GetBotVersions action.

``` swift
func getBotVersions(input: GetBotVersionsInput, completion: @escaping (ClientRuntime.SdkResult<GetBotVersionsOutputResponse, GetBotVersionsOutputError>) -> Void)
```

### getBuiltinIntent(input:​completion:​)

Returns information about a built-in intent.
This operation requires permission for the
lex:​GetBuiltinIntent action.

``` swift
func getBuiltinIntent(input: GetBuiltinIntentInput, completion: @escaping (ClientRuntime.SdkResult<GetBuiltinIntentOutputResponse, GetBuiltinIntentOutputError>) -> Void)
```

### getBuiltinIntents(input:​completion:​)

Gets a list of built-in intents that meet the specified
criteria.
This operation requires permission for the
lex:​GetBuiltinIntents action.

``` swift
func getBuiltinIntents(input: GetBuiltinIntentsInput, completion: @escaping (ClientRuntime.SdkResult<GetBuiltinIntentsOutputResponse, GetBuiltinIntentsOutputError>) -> Void)
```

### getBuiltinSlotTypes(input:​completion:​)

Gets a list of built-in slot types that meet the specified
criteria.
For a list of built-in slot types, see <a href="https:​//developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/built-in-intent-ref/slot-type-reference">Slot Type Reference in the Alexa Skills
Kit.

``` swift
func getBuiltinSlotTypes(input: GetBuiltinSlotTypesInput, completion: @escaping (ClientRuntime.SdkResult<GetBuiltinSlotTypesOutputResponse, GetBuiltinSlotTypesOutputError>) -> Void)
```

``` 
     This operation requires permission for the
    lex:GetBuiltInSlotTypes action.
```

### getExport(input:​completion:​)

Exports the contents of a Amazon Lex resource in a specified format.

``` swift
func getExport(input: GetExportInput, completion: @escaping (ClientRuntime.SdkResult<GetExportOutputResponse, GetExportOutputError>) -> Void)
```

### getImport(input:​completion:​)

Gets information about an import job started with the
StartImport operation.

``` swift
func getImport(input: GetImportInput, completion: @escaping (ClientRuntime.SdkResult<GetImportOutputResponse, GetImportOutputError>) -> Void)
```

### getIntent(input:​completion:​)

Returns information about an intent. In addition to the intent
name, you must specify the intent version.
This operation requires permissions to perform the
lex:​GetIntent action.

``` swift
func getIntent(input: GetIntentInput, completion: @escaping (ClientRuntime.SdkResult<GetIntentOutputResponse, GetIntentOutputError>) -> Void)
```

### getIntents(input:​completion:​)

Returns intent information as follows:​

``` swift
func getIntents(input: GetIntentsInput, completion: @escaping (ClientRuntime.SdkResult<GetIntentsOutputResponse, GetIntentsOutputError>) -> Void)
```

``` 
           If you specify the nameContains field, returns the
        $LATEST version of all intents that contain the
      specified string.


            If you don't specify the nameContains field,
      returns information about the $LATEST version of all
      intents.


      The operation requires permission for the
    lex:GetIntents action.
```

### getIntentVersions(input:​completion:​)

Gets information about all of the versions of an intent.
The GetIntentVersions operation returns an
IntentMetadata object for each version of an intent. For
example, if an intent has three numbered versions, the
GetIntentVersions operation returns four
IntentMetadata objects in the response, one for each
numbered version and one for the $LATEST version.
The GetIntentVersions operation always returns at
least one version, the $LATEST version.
This operation requires permissions for the
lex:​GetIntentVersions action.

``` swift
func getIntentVersions(input: GetIntentVersionsInput, completion: @escaping (ClientRuntime.SdkResult<GetIntentVersionsOutputResponse, GetIntentVersionsOutputError>) -> Void)
```

### getMigration(input:​completion:​)

Provides details about an ongoing or complete migration from an
Amazon Lex V1 bot to an Amazon Lex V2 bot. Use this operation to view the migration
alerts and warnings related to the migration.

``` swift
func getMigration(input: GetMigrationInput, completion: @escaping (ClientRuntime.SdkResult<GetMigrationOutputResponse, GetMigrationOutputError>) -> Void)
```

### getMigrations(input:​completion:​)

Gets a list of migrations between Amazon Lex V1 and Amazon Lex V2.

``` swift
func getMigrations(input: GetMigrationsInput, completion: @escaping (ClientRuntime.SdkResult<GetMigrationsOutputResponse, GetMigrationsOutputError>) -> Void)
```

### getSlotType(input:​completion:​)

Returns information about a specific version of a slot type. In
addition to specifying the slot type name, you must specify the slot type
version.
This operation requires permissions for the
lex:​GetSlotType action.

``` swift
func getSlotType(input: GetSlotTypeInput, completion: @escaping (ClientRuntime.SdkResult<GetSlotTypeOutputResponse, GetSlotTypeOutputError>) -> Void)
```

### getSlotTypes(input:​completion:​)

Returns slot type information as follows:​

``` swift
func getSlotTypes(input: GetSlotTypesInput, completion: @escaping (ClientRuntime.SdkResult<GetSlotTypesOutputResponse, GetSlotTypesOutputError>) -> Void)
```

``` 
           If you specify the nameContains field, returns the
        $LATEST version of all slot types that contain the
      specified string.


            If you don't specify the nameContains field,
      returns information about the $LATEST version of all slot
      types.


      The operation requires permission for the
    lex:GetSlotTypes action.
```

### getSlotTypeVersions(input:​completion:​)

Gets information about all versions of a slot type.
The GetSlotTypeVersions operation returns a
SlotTypeMetadata object for each version of a slot type.
For example, if a slot type has three numbered versions, the
GetSlotTypeVersions operation returns four
SlotTypeMetadata objects in the response, one for each
numbered version and one for the $LATEST version.
The GetSlotTypeVersions operation always returns at
least one version, the $LATEST version.
This operation requires permissions for the
lex:​GetSlotTypeVersions action.

``` swift
func getSlotTypeVersions(input: GetSlotTypeVersionsInput, completion: @escaping (ClientRuntime.SdkResult<GetSlotTypeVersionsOutputResponse, GetSlotTypeVersionsOutputError>) -> Void)
```

### getUtterancesView(input:​completion:​)

Use the GetUtterancesView operation to get information
about the utterances that your users have made to your bot. You can use
this list to tune the utterances that your bot responds to.
For example, say that you have created a bot to order flowers.
After your users have used your bot for a while, use the
GetUtterancesView operation to see the requests that they
have made and whether they have been successful. You might find that the
utterance "I want flowers" is not being recognized. You could add this
utterance to the OrderFlowers intent so that your bot
recognizes that utterance.
After you publish a new version of a bot, you can get information
about the old version and the new so that you can compare the performance
across the two versions.
Utterance statistics are generated once a day. Data is available
for the last 15 days. You can request information for up to 5 versions of
your bot in each request. Amazon Lex returns the most frequent utterances
received by the bot in the last 15 days. The response contains information
about a maximum of 100 utterances for each version.
If you set childDirected field to true when you
created your bot, if you are using slot obfuscation with one or more
slots, or if you opted out of participating in improving Amazon Lex, utterances
are not available.
This operation requires permissions for the
lex:​GetUtterancesView action.

``` swift
func getUtterancesView(input: GetUtterancesViewInput, completion: @escaping (ClientRuntime.SdkResult<GetUtterancesViewOutputResponse, GetUtterancesViewOutputError>) -> Void)
```

### listTagsForResource(input:​completion:​)

Gets a list of tags associated with the specified resource. Only bots,
bot aliases, and bot channels can have tags associated with them.

``` swift
func listTagsForResource(input: ListTagsForResourceInput, completion: @escaping (ClientRuntime.SdkResult<ListTagsForResourceOutputResponse, ListTagsForResourceOutputError>) -> Void)
```

### putBot(input:​completion:​)

Creates an Amazon Lex conversational bot or replaces an existing bot.
When you create or update a bot you are only required to specify a name, a
locale, and whether the bot is directed toward children under age 13. You
can use this to add intents later, or to remove intents from an existing
bot. When you create a bot with the minimum information, the bot is
created or updated but Amazon Lex returns the  response
FAILED. You can build the bot after you add one or more
intents. For more information about Amazon Lex bots, see how-it-works.
If you specify the name of an existing bot, the fields in the
request replace the existing values in the $LATEST version of
the bot. Amazon Lex removes any fields that you don't provide values for in the
request, except for the idleTTLInSeconds and
privacySettings fields, which are set to their default
values. If you don't specify values for required fields, Amazon Lex throws an
exception.

``` swift
func putBot(input: PutBotInput, completion: @escaping (ClientRuntime.SdkResult<PutBotOutputResponse, PutBotOutputError>) -> Void)
```

``` 
     This operation requires permissions for the lex:PutBot
  action. For more information, see security-iam.
```

### putBotAlias(input:​completion:​)

Creates an alias for the specified version of the bot or replaces
an alias for the specified bot. To change the version of the bot that the
alias points to, replace the alias. For more information about aliases,
see versioning-aliases.
This operation requires permissions for the
lex:​PutBotAlias action.

``` swift
func putBotAlias(input: PutBotAliasInput, completion: @escaping (ClientRuntime.SdkResult<PutBotAliasOutputResponse, PutBotAliasOutputError>) -> Void)
```

### putIntent(input:​completion:​)

Creates an intent or replaces an existing intent.
To define the interaction between the user and your bot, you use
one or more intents. For a pizza ordering bot, for example, you would
create an OrderPizza intent.
To create an intent or replace an existing intent, you must provide
the following:​

``` swift
func putIntent(input: PutIntentInput, completion: @escaping (ClientRuntime.SdkResult<PutIntentOutputResponse, PutIntentOutputError>) -> Void)
```

``` 
           Intent name. For example, OrderPizza.


           Sample utterances. For example, "Can I order a pizza, please."
      and "I want to order a pizza."


           Information to be gathered. You specify slot types for the
      information that your bot will request from the user. You can specify
      standard slot types, such as a date or a time, or custom slot types
      such as the size and crust of a pizza.


           How the intent will be fulfilled. You can provide a Lambda
      function or configure the intent to return the intent information to
      the client application. If you use a Lambda function, when all of the
      intent information is available, Amazon Lex invokes your Lambda function.
      If you configure your intent to return the intent information to the
      client application.


     You can specify other optional information in the request, such
  as:



           A confirmation prompt to ask the user to confirm an intent. For
      example, "Shall I order your pizza?"


           A conclusion statement to send to the user after the intent has
      been fulfilled. For example, "I placed your pizza order."


           A follow-up prompt that asks the user for additional activity.
      For example, asking "Do you want to order a drink with your
      pizza?"


     If you specify an existing intent name to update the intent, Amazon Lex
  replaces the values in the $LATEST version of the intent with
  the values in the request. Amazon Lex removes fields that you don't provide in
  the request. If you don't specify the required fields, Amazon Lex throws an
  exception. When you update the $LATEST version of an intent,
  the status field of any bot that uses the
    $LATEST version of the intent is set to
    NOT_BUILT.
     For more information, see how-it-works.
     This operation requires permissions for the
    lex:PutIntent action.
```

### putSlotType(input:​completion:​)

Creates a custom slot type or replaces an existing custom slot
type.
To create a custom slot type, specify a name for the slot type and
a set of enumeration values, which are the values that a slot of this type
can assume. For more information, see how-it-works.
If you specify the name of an existing slot type, the fields in the
request replace the existing values in the $LATEST version of
the slot type. Amazon Lex removes the fields that you don't provide in the
request. If you don't specify required fields, Amazon Lex throws an exception.
When you update the $LATEST version of a slot type, if a bot
uses the $LATEST version of an intent that contains the slot
type, the bot's status field is set to
NOT\_BUILT.

``` swift
func putSlotType(input: PutSlotTypeInput, completion: @escaping (ClientRuntime.SdkResult<PutSlotTypeOutputResponse, PutSlotTypeOutputError>) -> Void)
```

``` 
     This operation requires permissions for the
    lex:PutSlotType action.
```

### startImport(input:​completion:​)

Starts a job to import a resource to Amazon Lex.

``` swift
func startImport(input: StartImportInput, completion: @escaping (ClientRuntime.SdkResult<StartImportOutputResponse, StartImportOutputError>) -> Void)
```

### startMigration(input:​completion:​)

Starts migrating a bot from Amazon Lex V1 to Amazon Lex V2. Migrate your bot when
you want to take advantage of the new features of Amazon Lex V2.
For more information, see <a href="https:​//docs.aws.amazon.com/lex/latest/dg/migrate.html">Migrating a bot in the Amazon Lex
developer guide.

``` swift
func startMigration(input: StartMigrationInput, completion: @escaping (ClientRuntime.SdkResult<StartMigrationOutputResponse, StartMigrationOutputError>) -> Void)
```

### tagResource(input:​completion:​)

Adds the specified tags to the specified resource. If a tag key
already exists, the existing value is replaced with the new value.

``` swift
func tagResource(input: TagResourceInput, completion: @escaping (ClientRuntime.SdkResult<TagResourceOutputResponse, TagResourceOutputError>) -> Void)
```

### untagResource(input:​completion:​)

Removes tags from a bot, bot alias or bot channel.

``` swift
func untagResource(input: UntagResourceInput, completion: @escaping (ClientRuntime.SdkResult<UntagResourceOutputResponse, UntagResourceOutputError>) -> Void)
```
