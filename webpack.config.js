// Generated using webpack-cli https://github.com/webpack/webpack-cli

const path = require("path");
const HtmlWebpackPlugin = require("html-webpack-plugin");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");

const isProduction = process.env.NODE_ENV == "production";

const stylesHandler = isProduction
  ? MiniCssExtractPlugin.loader
  : "style-loader";

const config = {
  entry: "./src/index.js",
  output: {
    path: path.resolve(__dirname, "dist"),
  },
  devServer: {
    open: true,
    host: "localhost",
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: "./src/page/index.html",
    }),
    new HtmlWebpackPlugin({
      filename: "launch-guide.html",
      template: "./src/page/launch-guide.html",
    }),
    new HtmlWebpackPlugin({
      filename: "invitation.html",
      template: "./src/page/invitation.html",
    }),
    new HtmlWebpackPlugin({
      filename: "fill-a-report.html",
      template: "./src/page/fill-a-report.html",
    }),
    new HtmlWebpackPlugin({
      filename: "my-company.html",
      template: "./src/page/my-company.html",
    }),
    new HtmlWebpackPlugin({
      filename: "aside.html",
      template: "./src/components/aside.html",
    }),
    new HtmlWebpackPlugin({
      filename: "tr-immediate-team.html",
      template: "./src/page/tr-immediate-team.html",
    })
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
      // Add your rules for custom modules here
      // Learn more about loaders from https://webpack.js.org/loaders/
      {
        test: /\.html$/,
        use: [{
          loader: 'html-loader?interpolate'
        }]
      },
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
