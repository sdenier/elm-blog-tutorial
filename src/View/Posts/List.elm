module View.Posts.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Messages exposing (Msg)
import Models exposing (..)
import Routes exposing (Route(..), PostId)
import View.RouteNavigation exposing (goRoute)


view : Maybe (List Post) -> Html Msg
view maybePosts =
    case maybePosts of
        Just posts ->
            ul [ class "post-list" ] (List.map postNode posts)

        Nothing ->
            div [ class "empty-results" ] [ text "No posts" ]


postNode : Post -> Html Msg
postNode post =
    li [ class "post-entry" ]
        [ linkToPost post.id
            post.title
        ]


linkToPost : PostId -> String -> Html Msg
linkToPost postId postTitle =
    goRoute "post-link"
        (PostRoute postId)
        [ h2 [ class "post-header" ]
            [ text postTitle ]
        ]
