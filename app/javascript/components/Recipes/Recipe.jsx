import axios from 'axios';
import React, { useState, useEffect } from 'react'

const Recipe = (props) => {
  const [recipe, setRecipe] = useState();
  const [recipeIngredients, setRecipeIngredients] = useState({});
  const [loaded, setLoaded] = useState(false);

  useEffect(() => {
    // api/v1/recipes/1
    // recipes/1
    console.log(props)
    
    const id = props.match.params.id;
    const url = `/api/v1/recipes/${id}`;

    axios.get(url)
    .then(resp => {
      setRecipe(resp.data)
      setLoaded(true)
    })
    .catch(resp => console.error(resp));
  },[])

  return (
    <div className="wrapper">
    <div className="column">
      <div className="header"></div>
    </div>
    <div className="column">
        
    </div>
      { recipe ? JSON.stringify(recipe)
      : "Nothing" }
    </div>
  )
}

export default Recipe
