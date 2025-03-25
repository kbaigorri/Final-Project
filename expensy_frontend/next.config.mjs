/** @type {import('next').NextConfig} */
const nextConfig = {
 async rewrites(){
  return [
    {
    source: "/api/:path*",
    destination:"http://backend:8706/api/:path*", //Redirige internamente en el cluster
    }
  ];
 }
}

export default nextConfig
