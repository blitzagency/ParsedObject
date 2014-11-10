#ParsedObject

A fork of [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON) by
[Ruoyu Fu](https://github.com/lingoer) and
[Pinglin Tang](https://github.com/tangplin) that allows SwiftyJSON to be
used Swift <-> Objective-C. For examples, one might be embedding Python
and need to send a Python dictionary to Swift.

Additionally, provides a slightly more generic name `ParsedObject`
as it can be used for:

- JSON
- YAML
- XML
- etc

Basically, any serialized structure, not limited to JSON, but providing
all of the convenience of `SwiftyJSON`.

The primary difference between `SwiftyJSON.JSON` and
`ParsedObject.ParsedObject` is that `ParsedObject` is a now a
`@objc final class` as opposed to a Swift Struct which is not allowed in
Objective-C. Also, `JSON.nullJSON` has been renamed to
`ParsedObject.nullParsedObject` and must be called with `()` as it is no
longer a getter.
