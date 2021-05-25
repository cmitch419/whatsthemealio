import React from 'react'
import {
  Route,
  Switch
} from 'react-router-dom'

import Ingredient from '../components/Ingredient'
import Ingredients from '../components/Ingredients'
import Recipe from '../components/Recipe'
import Recipes from '../components/Recipes'

const App = () => {
  return (
    <Switch>
      <Route exact path="/ingredients/:id" component={Ingredient} />
      <Route exact path="/ingredients" component={Ingredients} />
      <Route exact path="/recipes/:id" component={Recipe} />
      <Route exact path="/recipe" component={Recipes} />
    </Switch>
    )
}

export default App
