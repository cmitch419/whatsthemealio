import React, { useEffect, useState } from 'react'
import axios from 'axios'
import { ItemCard } from '../Shared'
import { Grid, makeStyles } from '@material-ui/core';

const useStyles = makeStyles((theme) => ({
  root: {
    flexGrow: 1,
  }
}));

const Ingredients = () => {
  const [ingredients, setIngredients] = useState([])

  const classes = useStyles();

  useEffect(() => {
    axios.get('/api/v1/ingredients.json')
    .then(resp => setIngredients(resp.data.data))
    .catch(resp => console.log(resp))
  }, [ingredients.length])

  const list = ingredients.map(item => {
    return (
      <Grid key={item.id} item xs>
        <ItemCard
          id={item.id}
          type={item.type}
          attributes={item.attributes} />
      </Grid>
    )
  })

  return (
    <div className={classes.root}>
      <Grid container spacing={2}>
        {list}
      </Grid>
    </div>
  )
}

export default Ingredients
