// Generated using webpack-cli https://github.com/webpack/webpack-cli

const path = require("path");
const HtmlWebpackPlugin = require("html-webpack-plugin");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");

const isProduction = process.env.NODE_ENV == "production";

const stylesHandler = isProduction
  ? MiniCssExtractPlugin.loader
  : "style-loader";

const config = {
  entry: {
    index: "./src/index.js",
  },
  output: {
    path: path.resolve(__dirname, "dist"),
  },
  devServer: {
    open: true,
    host: "localhost",
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: "index.html",
      inject: true,
      chunks: ['index'],
      filename: 'index.html'
    }),
    new HtmlWebpackPlugin({
      template: "./src/pages/invite-your-team.html",
      inject: true,
      chunks: ['index'],
      filename: 'invite-your-team.html'
    }),
    new HtmlWebpackPlugin({
      template: "./src/pages/my-company.html",
      inject: true,
      chunks: ['index'],
      filename: 'my-company.html'
    }),
    new HtmlWebpackPlugin({
      template: "./src/pages/launch-guide.html",
      inject: true,
      chunks: ['index'],
      filename: 'launch-guide.html'
    }),
    new HtmlWebpackPlugin({
      template: "./src/pages/team-members.html",
      inject: true,
      chunks: ['index'],
      filename: 'team-members.html'
    }),
    new HtmlWebpackPlugin({
      template: "./src/pages/team-member.html",
      inject: true,
      chunks: ['index'],
      filename: 'team-member.html'
    }),
    
    // Add your plugins here
    // Learn more about plugins from https://webpack.js.org/configuration/plugins/
  ],
  module: {
    rules: [
      {
        test: /\.(js|jsx)$/i,
        loader: "babel-loader",
      },
      {
        test: /\.css$/i,
        use: [stylesHandler, "css-loader"],
      },
      {
        test: /\.s[ac]ss$/i,
        use: [stylesHandler, "css-loader", "sass-loader"],
      },
      {
        test: /\.(eot|svg|ttf|woff|woff2|png|jpg|gif)$/i,
        type: "asset",
      },
      { 
        test: /\.(html)$/,
        use: [{
          loader: 'html-loader?interpolate'
        }]
      },
      
      // Add your rules for custom modules here
      // Learn more about loaders from https://webpack.js.org/loaders/
    ],
  },
};

module.exports = () => {
  if (isProduction) {
    config.mode = "production";

    config.plugins.push(new MiniCssExtractPlugin());
  } else {
    config.mode = "development";
  }
  return config;
};
