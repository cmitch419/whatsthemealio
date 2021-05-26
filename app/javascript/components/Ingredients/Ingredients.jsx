import React, { useEffect, useState } from 'react'
import axios from 'axios'
import Ingredient from './Ingredient'

const Ingredients = () => {
  const [ingredients, setIngredients] = useState([])

  useEffect(() => {
    axios.get('/api/v1/ingredients.json')
    .then(resp => setIngredients(resp.data.data))
    .catch(resp => console.log(resp))
  }, [ingredients.length])

  const list = ingredients.map( item => {
    return (
      <Ingredient key={item.id} id={item.id} attributes={item.attributes} />
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

export default Ingredients
