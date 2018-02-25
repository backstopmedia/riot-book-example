<child>
  <p>{opts.name}</p>
  <h5>Favorite Foods</h5>
  <ul>
    <li each={opts.food_options} if={color == opts.favorite_color}>{name}</li>
  </ul>

  <style scoped>
    child {
      padding-top: 10px;
      border-bottom: 1px solid black;
    }

    child, child * {
      margin-left: 15px;
    }
  </style>
</child>
