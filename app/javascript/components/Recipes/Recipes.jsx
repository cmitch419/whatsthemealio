import axios from 'axios'
import React, { useEffect, useState } from 'react'
import { ItemCard } from '../Shared'

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
      <ItemCard
        key={item.id}
        id={item.id}
        type={item.type}
        attributes={item.attributes} />
    )
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
