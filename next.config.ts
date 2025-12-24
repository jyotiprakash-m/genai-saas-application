import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  output: "standalone", // Creates a standalone server for Docker
};

export default nextConfig;
