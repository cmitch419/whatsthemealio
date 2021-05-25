import React from 'react'
import { Link } from 'react-router-dom' 

const Recipe = (props) => {
  console.log(props)
  return (
    <div className="card">
      <div className="recipe-name">{props.attributes.name}</div>
      <div className="recipe-description">{props.attributes.description}</div>
      <div className="recipe-ingredients"></div>
      <div className="recipe-link">
        <Link to={`/recipes/${props.id}`}>View Recipe</Link>
      </div>
    </div>
  )
}

export default Recipe
