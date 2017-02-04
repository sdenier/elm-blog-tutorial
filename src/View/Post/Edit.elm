module View.Post.Edit exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, placeholder)
import Html.Events exposing (onInput)
import Messages exposing (..)
import Models exposing (..)


view : Maybe Post -> Html Msg
view current =
    div [ class "post-editor" ]
        [ input
            [ onInput UpdatePostTitle
            , class "title-input-field"
            , placeholder "Enter title"
            ]
            []
        , textarea
            [ onInput UpdatePostBody
            , class "body-input-field"
            , placeholder "Enter body"
            ]
            []
        ]
