module Client.Pages.Bingo.BingoModel where
import Client.Pages.Bingo.BingoUtils as Utils

-- MODEL

type alias Entry = { 
    phrase: String, 
    points: Int,
    wasSpoken: Bool,
    id: Int
  }
type alias Model = {
    entries: List Entry,
    phraseInput: String,
    pointsInput: String,
    nextID: Int
  }

newEntry : String -> Int -> Int -> Entry
newEntry phrase points id = { 
    phrase = phrase,
    points = points,
    wasSpoken = False,
    id = id
  }

initialModel : Model
initialModel = {
  entries = [ 
      newEntry "Doing Agile" 200 2,
      newEntry "In the Cloud" 300 3,
      newEntry "Future-Proof" 100 1,
      newEntry "Rock Star Ninja" 400 4
    ],
    phraseInput = "",
    pointsInput = "",
    nextID = 5
  }