module Test.Requests exposing (..)

import Test exposing (..)
import Expect
import Json.Decode as Json
import Models exposing (Post)
import Requests exposing (decodePost)


tests : Test
tests =
    describe "Decoders"
        [ decodePostTests
        ]


decodePostTests : Test
decodePostTests =
    describe "#decodePost"
        [ test "should return an Ok Post for valid payload" <|
            \() -> Expect.equal expectedPost (Json.decodeString decodePost validPayload)
        , test "should return an Error for invalid payload" <|
            \() -> Expect.equal expectedError (Json.decodeString decodePost invalidPayload)
        ]


expectedPost : Result String Post
expectedPost =
    let
        post =
            { id = 123, author = "Arthur", title = "King of Camalot", body = "Monty Python" }
    in
        (Ok post)


validPayload : String
validPayload =
    """
    { "id": 123
    , "author": "Arthur"
    , "title": "King of Camalot"
    , "body": "Monty Python"
    }
    """


expectedError : Result String Post
expectedError =
    (Err "Expecting an object with a field named `id` but instead got: {}")


invalidPayload : String
invalidPayload =
    """
    {}
    """
