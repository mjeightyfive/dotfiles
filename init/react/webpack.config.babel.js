import HtmlWebpackPlugin from 'html-webpack-plugin';
import autoprefixer from 'autoprefixer';
import cssnano from 'cssnano';
import postcssPresetEnv from 'postcss-preset-env';
import postcssImport from 'postcss-import';

const isProduction = process.env.NODE_ENV === 'production';

const postCssOptions = {
    sourceMap: !isProduction,
    plugins: [
        postcssImport(),
        postcssPresetEnv(),
        autoprefixer()
    ]
};

if (isProduction) {
    postCssOptions.plugins.push(cssnano({ preset: ['default', { discardComments: { removeAll: true } }] }));
}

module.exports = {
    module: {
        rules: [{
            test: /\.js$/,
            exclude: /node_modules/,
            use: { loader: 'babel-loader' }
        }, {
            test: /\.css$/,
            use: [
                { loader: 'style-loader' },
                {
                    loader: 'css-loader',
                    options: {
                        importLoaders: 1,
                        sourceMap: !isProduction
                    }
                },
                {
                    loader: 'postcss-loader',
                    options: postCssOptions
                }
            ]
        }, {
            test: /\.scss$/,
            use: [
                { loader: 'style-loader' },
                {
                    loader: 'css-loader',
                    options: {
                        sourceMap: !isProduction
                    }
                }, {
                    loader: 'postcss-loader',
                    options: postCssOptions
                },
                { loader: 'sass-loader', options: { sourceMap: !isProduction } }
            ]
        }, {
            test: /\.html$/,
            use: [{ loader: 'html-loader', options: { minimize: isProduction } }]
        }]
    },
    plugins: [
        new HtmlWebpackPlugin({
            template: './src/index.html',
            filename: 'index.html'
        })
    ],
    optimization: {
        minimize: isProduction
    }
};
