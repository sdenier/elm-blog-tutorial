module View.Post.Show exposing (..)

import Html exposing (..)
import Models exposing (..)


view : Maybe Post -> Html msg
view current =
    case current of
        Just post ->
            div []
                [ h2 [] [ text post.title ]
                , text post.body
                ]

        Nothing ->
            div [] [ text "No post to show" ]
