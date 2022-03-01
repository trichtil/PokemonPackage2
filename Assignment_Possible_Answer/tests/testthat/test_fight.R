library(PokemonPackage)

test_that("awake changes to false if HP is <0",{
  p1 = Pokemon$new("Eevee")
  p2 = Pokemon$new("Snorlax")
  while(p1$HP > 0 & p2$HP > 0 ){
    p1$fight(p2)
  }#while
  if(p1$HP < p2$HP){
    expect_equal(p1$awake, FALSE)
  }else{
    expect_equal(p2$awake, FALSE)
  }
})

test_that("if Pokemon is not awake it cannot fight",{
  p1 = Pokemon$new("Shinx")
  p2 = Pokemon$new("Luxio")
  p1$awake =FALSE
  expect_error(p1$fight(p2))
  expect_error(p2$fight(p1))
})
