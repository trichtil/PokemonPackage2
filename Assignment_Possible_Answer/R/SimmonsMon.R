# for all functions, you can return values based on the first or random record if there are multiple matches,

# 1.  Write a function to print some information about a pokemon, Print its name, classification, and primary and secondary types


#' Function for getting data about a single pokemon
#' @param name name of the pokemon we want information about
#' @examples pokeDex("Litwick")
#' @return  None
#' @export
pokeDex<-function(name){
  pokeRow = pokemon_data[pokemon_data$Pokemon.Name == name,]
  print(paste(pokeRow[1, "Pokemon.Name"], pokeRow[1, "Classification"], pokeRow[1, "Primary.Type"], pokeRow[1, "Secondary.Type"]))


}





# Then
#1.  create a package with the data set and functions
#2.  roxygen notes, generate the documentation,
#3.  install the package
#4.  view your documentaion with ?pokeDex etc
#5.  use your functions







#Pokemon class

library(R6)
#' R6 Class representing a pokemon
#'
#' A pokemon has a name, primary type, secondary type, health points, and is awake or not awake
#' @importFrom R6 R6Class
#' @export
Pokemon = R6Class(
  "Pokemon",
  public = list(
    #' @field name Name of the pokemon
    name = NULL,
    #' @field type1 Primary type of the pokemon
    type1 = NULL,
    #' @field type2 Secondary type of the pokemon
    type2 = NULL,
    #' @field HP Health points of the pokemon
    HP = NULL,
    #' @field awake If the pokemon is awake or not
    awake = NULL,

    #' @description
    #' Create a new pokemon object
    #' @param name Name of the pokemon
    #' @return A new 'Pokemon' object
    initialize = function(name){
      data(pokemon_data)
      if(name %in% pokemon_data$Pokemon.Name){
      pokeRow = pokemon_data[pokemon_data$Pokemon.Name == name,]
      self$name = name
      self$type1 = pokeRow[1, "Primary.Type"]
      self$type2 = pokeRow[1, "Secondary.Type"]
      self$HP = pokeRow[1, "Health.Stat"]
      self$awake = TRUE
      self$show()
      }
    },

    #' @description
    #' Show the pokemon information
    show = function(){
      cat("Name: ",self$name,"\nPrimary Type: ",self$type1,"\nSecondary Type: ",self$type2,"\nHealth Points: ",self$HP,"\nAwake: ",self$awake)
    },

    #' @description
    #' Change the health points
    #' @param change The amount hp will change by
    changeHP = function(change){
      currentHP = self$HP
      newHP = currentHP + change
      self$HP = newHP
      if (newHP <= 0){
        self$awake = FALSE
      }
    },

    #' @description
    #' Two pokemon fight - change the HP of each
    #' @param opponent The pokemon to be fought
    fight = function(opponent){
      if(self$awake == TRUE & opponent$awake==TRUE){
        self$changeHP(-20)
        opponent$changeHP(-20)
        print(self$HP)
        print(opponent$HP)
      }
      else{stop("One or more of the pokemon is not awake")
      }
    }
  )
)


#' Data about Pokemon
#'
#' a dataset with data about pokemon from source
#'
#' @format A dataframe wit 1076 number of rows/observations and 47 variables
#' \describe {
#'  \item{Pokemon.Id}{the ID number for this pokemon in this dataset}
#' \item{Pokemon.Name}{The official name of the pokemon}
#' }
#' @source 2u
"pokemon_data"
