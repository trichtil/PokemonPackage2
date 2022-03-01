library(PokemonPackage)


test_that("initalize function works for Pokemon that exists",{
  p=Pokemon$new("Litwick")
  expect_equal(p$name, "Litwick")
  expect_equal(p$HP, 50)
  expect_equal(p$type1, "Ghost")
  expect_equal(p$type2, "Fire")
  expect_equal(p$awake, TRUE)
})

test_that("initialize func doesn't work for Pokemon that doesn't exist",{
  p=Pokemon$new("Ltck")
  expect_equal(p$name, NULL)
  expect_equal(p$HP, NULL)
  expect_equal(p$type1, NULL)
  expect_equal(p$type2, NULL)
  expect_equal(p$awake, NULL)
})






