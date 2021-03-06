module Test.Routes exposing (..)

import Test exposing (..)
import Expect
import Models exposing (Route(..))
import Navigation
import Routes exposing (..)


tests : Test
tests =
    describe "Routing"
        [ pathTests
        , routerTests
        ]


pathTests : Test
pathTests =
    describe "#pathFor"
        [ test "HomeRoute should translate to '/'" <|
            \() -> Expect.equal "/" (pathFor HomeRoute)
        , test "NotFound should translate to '/'" <|
            \() -> Expect.equal "/" (pathFor NotFound)
        , test "NewPostRoute should translate to '/posts/new'" <|
            \() -> Expect.equal "/posts/new" (pathFor NewPostRoute)
        , test "PostRoute should translate to '/posts/:postId'" <|
            \() -> Expect.equal "/posts/89" (pathFor (PostRoute 89))
        ]


routerTests : Test
routerTests =
    describe "#router"
        [ test "HomeRoute should match root path" <|
            \() -> Expect.equal (Just HomeRoute) (router rootLocation)
        , test "NewPostRoute should match '/posts/new'" <|
            \() -> Expect.equal (Just NewPostRoute) (router newPostLocation)
        , test "PostRoute should match /posts/:id" <|
            \() -> Expect.equal (Just <| PostRoute 89) (router postLocation)
        , test "PostRoute should not match another PostId" <|
            \() -> Expect.notEqual (Just <| PostRoute 123) (router postLocation)
        , test "NotFound should match unknown path" <|
            \() -> Expect.equal Nothing (router unknownLocation)
        ]


rootLocation : Navigation.Location
rootLocation =
    { mockLocation | pathname = "/" }


newPostLocation : Navigation.Location
newPostLocation =
    { mockLocation | pathname = "/posts/new" }


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
