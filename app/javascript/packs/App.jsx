import React from 'react'
import {
  Route,
  Switch
} from 'react-router-dom'

import Ingredient from '../components/Ingredient'
import Ingredients from '../components/Ingredients'

const App = () => {
  return (
    <Switch>
      <Route exact path="/ingredients" component={Ingredients} />
      <Route exact path="/ingredients/:id" component={Ingredient} />
    </Switch>
    )
}

export default App
