import axios from 'axios'
import React, { useEffect, useState } from 'react'

import Recipe from './Recipe'

const Recipes = () => {
  const [recipes, setRecipes] = useState([])

  useEffect(() => {
    axios.get('/api/v1/recipes.json')
    .then(resp => {
      setRecipes(resp.data.data)
    })
    .catch(resp => console.log(resp))
  }, [recipes.length])

  const list = recipes.map( item => {
    return (
      <Recipe key={item.id} id={item.id} attributes={item.attributes} /> )
  })

  return (
    <>
      <div className="grid">
        {list}
      </div>
    </>
  )
}

export default Recipes
