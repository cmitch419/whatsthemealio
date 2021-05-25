import React from 'react'
import { Link } from 'react-router-dom' 

const Ingredient = (props) => {
  console.log(props)
  return (
    <div className="card">
      <div className="ingredient-name">{props.attributes.name}</div>
      <div className="ingredient-description">{props.attributes.description}</div>
      <div className="ingredient-link">
        <Link to={`/ingredients/${props.id}`}>View Ingredient</Link>
      </div>
    </div>
  )
}

export default Ingredient
