port module Ports exposing (..)

import Models exposing (..)


port saveDraft : Maybe Post -> Cmd msg


port getDraft : () -> Cmd msg


port loadDraft : (Post -> msg) -> Sub msg
