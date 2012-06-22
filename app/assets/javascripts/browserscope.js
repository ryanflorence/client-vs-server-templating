/*global google*/
/*jslint browser: true*/
(function (win, doc) {
    'use strict';
    var drawChart, fetchData,
        key = 'agt1YS1wcm9maWxlcnINCxIEVGVzdBjkgaARDA',
        cb = '_' + parseInt(Math.random() * 1e9, 10);

    drawChart = function (json) {
        var browserName, browser, testName, test, line, browserResults, data,
            chart = new google.visualization.BarChart(doc.getElementById('chart')),
            results = json.results,
            lines = [],
            headerHash = {},
            header = ['Browser'];

        for (browserName in results) {
            if (results.hasOwnProperty(browserName)) {
                browser = results[browserName];
                line = [browserName + ' (' + browser.count + ')'];
                browserResults = browser.results;
                for (testName in browserResults) {
                    if (browserResults.hasOwnProperty(testName)) {
                        if (!headerHash[testName]) {
                            headerHash[testName] = 1;
                            header.push(testName);
                        }
                        test = browserResults[testName];
                        line.push(parseInt(test.result, 10) / 1e6);
                    }
                }
                lines.push(line);
            }
        }
        data = [header].concat(lines);

        chart.draw(google.visualization.arrayToDataTable(data), {
            title: json.category_name,
            hAxis: {
                title: 'time (ms) lower is better'
            },
            vAxis: {
                title: 'browser (# of tests)'
            }
        });
    };

    win[cb] = function (response) {
        drawChart(response);
        var script = doc.createElement('script'),
            first = doc.getElementsByTagName('script')[0];

        script.async = 1;
        script.src = 'http://www.browserscope.org/ua?o=js';
        first.parentNode.insertBefore(script, first);
    };

    fetchData = function () {
        var script = doc.createElement('script'),
            first = doc.getElementsByTagName('script')[0];

        script.async = 1;
        script.src = '//www.browserscope.org/user/tests/table/' + key +
            '?v=3&o=json&callback=' + cb;
        first.parentNode.insertBefore(script, first);
    };

    win.Browserscope = {
        update: fetchData
    };
}(window, document));
