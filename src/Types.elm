module Types exposing (..)


type Model
    = Setup SetupModel
    | Play PlayModel
    | MoreInfo Event Model
    | Wrong Event (Maybe Int) (Maybe Int) Model
    | Ended Int (List Event)


type alias SetupModel =
    { units : List Unit
    , size : Int
    , hardMode : Bool
    }


type alias PlayModel =
    { deck : List Event
    , active : Event
    , played : List Event
    , score : Int
    , hardMode : Bool
    }


type alias Event =
    { name : String
    , date : Int
    , desc : String
    }


type Msg
    = Guess (Maybe Int) (Maybe Int) -- Guess the *active* to be *between* event 1 & 2
    | Select Unit
    | LearnMore Event
    | Back
    | Start
    | ChangeNum String
    | HaveDeck (List Event)
    | ChangeHardMode


type Unit
    = I
    | II
    | III
    | IV
    | V
    | VI
    | VII
    | VIII
    | IX
    | X
    | XI
    |XII


-- Not great that this is needed


unitList : List Unit
unitList =
    [ I, II, III, IV, V, VI, VII, VIII, IX, X, XI, XII]


unitToStr : Unit -> String
unitToStr u =
    case u of
        I -> "I"
        II -> "II"
        III -> "III"
        IV -> "IV"
        V -> "V"
        VI -> "VI"
        VII -> "VII"
        VIII -> "VIII"
        IX -> "IX"
        X -> "X"
        XI -> "XI"
        XII -> "XII"

-- gives a (string) of the start and end dates of the unit
unitPeriod : Unit -> String
unitPeriod u =
    " (" ++ (case u of
                I  -> "17th Century"
                II -> "Period of Salutary Neglect"
                III -> "Federalist Period"
                IV -> "1800-1840"
                V -> "Civil War" 
                VI -> "Reconstruction"
                VII -> "Gilded Age"
                VIII -> "Age of Empire"
                IX -> "Progressive Era"
                X -> "New Deal"
                XI -> "WWII"
                XII -> "Cold War"
            )
        ++ ") "
                
