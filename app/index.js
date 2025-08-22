export const handler = async (event) => {
  const name = event?.queryStringParameters?.name ?? "world";
  return {
    statusCode: 200,
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ message: `Hello, ${name}!` }),
  };
};
