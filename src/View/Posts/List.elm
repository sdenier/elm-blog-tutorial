module View.Posts.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Messages exposing (..)
import Routes exposing (Route(..))
import Common.HtmlUtils exposing (goLink)


view : Html Msg
view =
    ul [ class "post-list" ]
        [ li [ class "post-entry" ]
            [ linkToPost 89
                "4 Reasons Why You Shouldn't Punch Your Boss"
            ]
        ]


linkToPost : PostId -> String -> Html Msg
linkToPost postId postTitle =
    goLink "post-link"
        (Routes.reverse (PostRoute postId))
        (ShowPost postId)
        [ h2 [ class "post-header" ]
            [ text postTitle ]
        ]
