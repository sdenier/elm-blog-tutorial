module Test.Routes exposing (..)

import Test exposing (..)
import Expect
import Navigation
import Routes exposing (..)


tests : Test
tests =
    describe "Routing"
        [ reverseTests
        , routerTests
        ]


reverseTests : Test
reverseTests =
    describe "#reverse"
        [ test "HomeRoute should translate to '/'" <|
            \() -> Expect.equal "/" (reverse HomeRoute)
        , test "NotFound should translate to '/'" <|
            \() -> Expect.equal "/" (reverse NotFound)
        , test "PostRoute should translate to '/posts/:postId'" <|
            \() -> Expect.equal "/posts/89" (reverse (PostRoute 89))
        ]


routerTests : Test
routerTests =
    describe "#router"
        [ test "HomeRoute should match root path" <|
            \() -> Expect.equal HomeRoute (router rootLocation)
        , test "PostRoute should match /posts/:id" <|
            \() -> Expect.equal (PostRoute 89) (router postLocation)
        , test "PostRoute should not match another PostId" <|
            \() -> Expect.notEqual (PostRoute 123) (router postLocation)
        , test "NotFound should match unknown path" <|
            \() -> Expect.equal NotFound (router unknownLocation)
        ]


rootLocation : Navigation.Location
rootLocation =
    { mockLocation | pathname = "/" }


postLocation : Navigation.Location
postLocation =
    { mockLocation | pathname = "/posts/89" }


unknownLocation : Navigation.Location
unknownLocation =
    { mockLocation | pathname = "/unknownPath" }


mockLocation : Navigation.Location
mockLocation =
    { href = "fake"
    , host = "fake"
    , hostname = "fake"
    , protocol = "fake"
    , origin = "fake"
    , port_ = "fake"
    , pathname = "fake"
    , search = "fake"
    , hash = "fake"
    , username = "fake"
    , password = "fake"
    }
