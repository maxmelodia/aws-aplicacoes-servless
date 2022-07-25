async function handler(event, context)  {
  console.log('Ambiente..', JSON.stringify(process.env, null, 2));
  console.log('Evento..', JSON.stringify(event, null, 2));

  return {
    hello: "There is no one size fits all!"
  }
}

module.exports = {
  handler
}
