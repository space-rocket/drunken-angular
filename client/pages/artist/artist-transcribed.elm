module App where

import Debug
import Html exposing (..)
import Html.Attributes exposing (class)
import Http
import Json.Decode exposing ((:=))
import Task exposing (Task, andThen)

-- MODEL

type alias Artist =
  { id: Int
  , name: String
  }

type alias Model = 
  List Artist

init : Model
init =
  []

type Action
  = NoOp
  | SetArtists (List Artist)

update : Action -> Model -> Model
update action model =
  case action of 
    NoOp ->
      model

    SetArtists model' ->
      model'

view : Model -> Html
view model =
  div [] [text "Loading"]

actions : Signal.Mailbox Action
actions =
  Signal.mailbox NoOp

type alias Mailbox a =
  { address : Address a
  , signal : Signal a
  }

foldp : (a -> state -> state) -> state -> Signal a -> Signal state
foldp : (Action -> Model -> Model) -> Model -> Signal Action -> Signal Model

model : Signal Model
model = Signal.foldp update init actions.signal

main : Signal Html
main = 
  Signal.map view model

artist : Json.Decode.Decoder Artist
artist =
  Json.Decode.object2 Artist
    ("id" := Json.Decode.int)
    ("name" := Json.Decode.string)

get : Task Http.Error (List Artist)
get =
  Http.get (Json.Decode.list artist) "/api/artists"

port runner : Task Http.Error ()
port runner =
  get `andThen` (SetArtusts >> Signal.send actions.address)

view : Model -> Html
view model =
  let th' field = th [] [text field]
      tr' artist = th [] [ td [] [text <| toString artist.id]
                         , td [] [text <| artist.name]
                         ]

  in 
    div [class "container"]
    [ table [class "table table-striped table-bordered"]
      [ thead [] [tr [] (List.map th' ["ID", "name"])]
      , tbody [] (List.map tr' model)
      ]
    ]




