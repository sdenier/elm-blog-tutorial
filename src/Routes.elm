module Routes exposing (..)

import Navigation
import UrlParser as Url exposing ((</>))


type alias PostId =
    Int


type Route
    = HomeRoute
    | PostRoute PostId
    | EditRoute PostId
    | NotFound


postParser : Url.Parser (Int -> a) a
postParser =
    Url.s "posts" </> Url.int


routePatterns : Url.Parser (Route -> c) c
routePatterns =
    Url.oneOf
        [ Url.map HomeRoute Url.top
        , Url.map PostRoute postParser
        , Url.map EditRoute (postParser </> Url.s "edit")
        ]


router : Navigation.Location -> Route
router location =
    let
        routeResult =
            Url.parsePath routePatterns location
    in
        case routeResult of
            Just route ->
                route

            Nothing ->
                NotFound


reverse : Route -> String
reverse route =
    case route of
        PostRoute postId ->
            "/posts/" ++ (toString postId)

        _ ->
            "/"
