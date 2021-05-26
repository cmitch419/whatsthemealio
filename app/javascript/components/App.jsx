import React from 'react'
import { Route, Switch } from 'react-router-dom'
import { Ingredient, Ingredients } from './Ingredients'
import { Recipe, Recipes } from './Recipes'
import Page404 from './Page404'

const App = () => {
  return (
    <Switch>
      <Route exact path="/ingredients/:id" component={Ingredient} />
      <Route exact path="/ingredients" component={Ingredients} />
      <Route exact path="/recipes/:id" component={Recipe} />
      <Route exact path="/recipes" component={Recipes} />

      {/* Default to the 404 page */}
      <Route path="/*" component={Page404} />
    </Switch>
    )
}

export default App
