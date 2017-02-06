module Routes exposing (..)

import Common.HtmlUtils
import Models exposing (..)
import Navigation
import UrlParser as Url exposing ((</>))


postParser : Url.Parser (Int -> a) a
postParser =
    Url.s "posts" </> Url.int


routePatterns : Url.Parser (Route -> c) c
routePatterns =
    Url.oneOf
        [ Url.map HomeRoute Url.top
        , Url.map NewPostRoute (Url.s "posts" </> Url.s "new")
        , Url.map EditDraftRoute (Url.s "posts" </> Url.s "draft")
        , Url.map PostRoute postParser
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


pathFor : Route -> Common.HtmlUtils.Url
pathFor route =
    case route of
        NewPostRoute ->
            "/posts/new"

        EditDraftRoute ->
            "/posts/draft"

        PostRoute postId ->
            "/posts/" ++ (toString postId)

        _ ->
            "/"
