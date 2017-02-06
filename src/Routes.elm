module Routes exposing (..)

import HtmlUtils
import Models exposing (..)
import Navigation
import UrlParser as Url exposing ((</>))


postParser : Url.Parser a a
postParser =
    Url.s "posts"


routePatterns : Url.Parser (Route -> c) c
routePatterns =
    Url.oneOf
        [ Url.map HomeRoute Url.top
        , Url.map NewPostRoute (postParser </> Url.s "new")
        , Url.map EditDraftRoute (postParser </> Url.s "draft")
        , Url.map PostRoute (postParser </> Url.int)
        ]


router : Navigation.Location -> Maybe Route
router location =
    Url.parsePath routePatterns location


pathFor : Route -> HtmlUtils.Url
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
