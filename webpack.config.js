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
      filename: "index.html",
      template: "src/pages/launch-guide.html",
    }),
    new HtmlWebpackPlugin({
      filename: "pages/my-reports.html",
      template: "src/pages/my-reports.html",
    }),
    new HtmlWebpackPlugin({
      filename: "pages/launch-guide.html",
      template: "src/pages/launch-guide.html",
    }),
    new HtmlWebpackPlugin({
      filename: "pages/team-reports.html",
      template: "src/pages/team-reports.html",
    }),
    new HtmlWebpackPlugin({
      filename: "pages/weekly-report-history.html",
      template: "src/pages/weekly-report-history.html",
    }),
    new HtmlWebpackPlugin({
      filename: "pages/fill-report.html",
      template: "src/pages/fill-report.html",
    }),
    new HtmlWebpackPlugin({
      filename: "pages/invite-your-team.html",
      template: "src/pages/invite-your-team.html",
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
        test: /\.html$/i,
        use: [{ loader: "html-loader?interpolate" }],
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
