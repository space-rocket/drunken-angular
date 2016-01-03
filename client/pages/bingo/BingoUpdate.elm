module Client.Pages.Bingo.BingoUpdate where
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import String exposing (toUpper, repeat, trimRight)
import StartApp.Simple as StartApp
import Signal exposing (Address)
import Client.Pages.Bingo.BingoUtils as Utils
import Client.Pages.Bingo.BingoModel exposing (..)

type Action = NoOp 
            | Sort 
            | Delete Int 
            | Mark Int 
            | UpdatePhraseInput String 
            | UpdatePointsInput String
            | Add

update : Action -> Model -> Model
update action model =
  case action of
    NoOp -> model
    Sort -> { model | entries <- List.sortBy .points model.entries }
    Delete id ->
      let
        remainingEntries =
          List.filter (\e -> e.id /= id) model.entries
        --_ = Debug.log "the remaining entries" remainingEntries
      in
        { model | entries <- remainingEntries }

    Mark id ->
      let 
        updateEntry e =
          if e.id == id then {
            e | wasSpoken <- (not e.wasSpoken)
          } else e
      in { 
          model | entries <- List.map updateEntry model.entries 
        }

    UpdatePhraseInput contents -> {
        model | phraseInput <- contents
      }

    UpdatePointsInput contents -> {
        model | pointsInput <- contents
      }

    Add ->
      let
        entryToAdd =
          newEntry model.phraseInput (Utils.parseInt model.pointsInput) model.nextID
        
        isInvalid model = 
          String.isEmpty model.phraseInput || String.isEmpty model.pointsInput

      in 
        if isInvalid model
          then model
          else {
              model | phraseInput <- "",
                      pointsInput <- "",
                      entries <- entryToAdd :: model.entries,
                      nextID <- model.nextID + 1
            }