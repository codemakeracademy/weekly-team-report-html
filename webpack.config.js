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
      inject: true,
      chunks: ['index'],
      template: "index.html",
    }),
    new HtmlWebpackPlugin({
      filename: "team_reports.html",
      inject: true,
      chunks: ['index'],
      template: "team_reports.html",
    }),
    new HtmlWebpackPlugin({
      filename: "invite_team.html",
      inject: true,
      chunks: ['index'],
      template: "invite_team.html",
    }),
    new HtmlWebpackPlugin({
      filename: "invite_team_success.html",
      inject: true,
      chunks: ['index'],
      template: "invite_team_success.html",
    }),
    new HtmlWebpackPlugin({
      filename: "edit_info.html",
      inject: true,
      chunks: ['index'],
      template: "edit_info.html",
    }),
    new HtmlWebpackPlugin({
      filename: "team_members.html",
      inject: true,
      chunks: ['index'],
      template: "team_members.html",
    }),
    new HtmlWebpackPlugin({
      filename: "weekly_report_history.html",
      inject: true,
      chunks: ['index'],
      template: "weekly_report_history.html",
    }),
    new HtmlWebpackPlugin({
      filename: "my_profile.html",
      inject: true,
      chunks: ['index'],
      template: "my_profile.html",
    }),
    new HtmlWebpackPlugin({
      filename: "my_reports.html",
      inject: true,
      chunks: ['index'],
      template: "my_reports.html",
    }),
    new HtmlWebpackPlugin({
      filename: "fill_out_report.html",
      inject: true,
      chunks: ['index'],
      template: "fill_out_report.html",
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
        test: /\.s[ac]ss$/i,
        use: [stylesHandler, "css-loader", "sass-loader"],
      },
      {
        test: /\.(eot|svg|ttf|woff|woff2|png|jpg|gif)$/i,
        type: "asset",
      },
      {
        test: /\.html$/i,
        use: [{
          loader: "html-loader?interpolate"
        }]
      }

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
