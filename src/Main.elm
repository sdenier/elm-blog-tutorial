module Main exposing (..)

import Navigation
import Html exposing (..)
import Html.Attributes exposing (class, href)
import Html.Events as Evt exposing (..)
import Json.Decode as Json
import UrlParser as Url exposing ((</>))


-- MAIN


main : Program Never State Msg
main =
    Navigation.program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = (\_ -> Sub.none)
        }



-- ROUTES


type alias PostId =
    Int


type Route
    = HomeRoute
    | PostsRoute
    | PostRoute PostId
    | EditRoute PostId
    | NotFound


postsParser : Url.Parser a a
postsParser =
    Url.s "posts"


postParser : Url.Parser (Int -> a) a
postParser =
    postsParser </> Url.int


routePatterns : Url.Parser (Route -> c) c
routePatterns =
    Url.oneOf
        [ Url.map HomeRoute Url.top
        , Url.map PostsRoute postsParser
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



-- MODEL


type alias State =
    { route : Route }


initialState : Route -> State
initialState route =
    { route = route }


init : Navigation.Location -> ( State, Cmd Msg )
init location =
    ( initialState (router location), Cmd.none )



-- UPDATE


type Msg
    = UrlChange Navigation.Location
    | GoHome
    | GoPosts


update : Msg -> State -> ( State, Cmd Msg )
update msg state =
    case msg of
        GoHome ->
            ( state, Navigation.newUrl "/" )

        GoPosts ->
            ( state, Navigation.newUrl "/posts" )

        UrlChange location ->
            ( { state | route = (router location) }, Cmd.none )



-- VIEW


view : State -> Html Msg
view state =
    div [ class "text-wrap" ]
        [ viewHeader
        , viewBody state
        ]


viewHeader : Html Msg
viewHeader =
    header [ class "main-header" ]
        [ goLink "/" GoHome "Home"
        , goLink "/posts" GoPosts "Posts"
        ]


goLink : String -> Msg -> String -> Html Msg
goLink url msg linkText =
    let
        linkOptions =
            { stopPropagation = True, preventDefault = True }

        linkHandler =
            Evt.onWithOptions "click" linkOptions (Json.succeed msg)
    in
        a [ href url, linkHandler, class "nav-link" ]
            [ text linkText ]


viewBody : State -> Html Msg
viewBody state =
    div [ class "body-wrap" ] [ bodyContent state ]


bodyContent : State -> Html Msg
bodyContent state =
    case state.route of
        HomeRoute ->
            div [] [ text "Home" ]

        PostsRoute ->
            div [] [ text "Posts" ]

        PostRoute postId ->
            div [] [ text ("Post #" ++ (toString postId)) ]

        EditRoute postId ->
            div [] [ text ("Edit Post #" ++ (toString postId)) ]

        NotFound ->
            div [] [ text "Not Found" ]
