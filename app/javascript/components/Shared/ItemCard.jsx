import React from 'react'
import { Link as RouterLink } from 'react-router-dom'
import {
  Button,
  Card,
  CardActions,
  CardContent,
  makeStyles,
  Typography
} from '@material-ui/core'
import { toTitleCase } from '../../utils'

const useStyles = makeStyles({
  root: {
    minWidth: 275,
  },
  bullet: {
    display: 'inline-block',
    margin: '0 2px',
    transform: 'scale(0.8)',
  },
  title: {
    fontSize: 14,
  },
  pos: {
    marginBottom: 12,
  },
});

const ItemCard = ({ id, type, attributes }) => {
  const classes = useStyles()
  const { name, description } = attributes
  const url = `/${type}s/${id}`

  return (
    <Card className={classes.root} variant="outlined">
      <CardContent>
        <Typography className={classes.title} color="textSecondary" gutterBottom>
          {toTitleCase(type)}
        </Typography>
        <Typography variant="h5" component="h2">
          {name}
        </Typography>
        <Typography variant="body2" component="p">
          {description}
        </Typography>
      </CardContent>
      <CardActions>
        <Button size="small" component={RouterLink} to={url}>View {toTitleCase(type)}</Button>
      </CardActions>
    </Card>
  );
}

export default ItemCard
