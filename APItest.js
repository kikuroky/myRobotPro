pm.test("Check if res is success", function () {
    //checking response data
    var jsonData = pm.response.json();
    //checking if the parameter equals to the value
    pm.expect(jsonData.code).to.eql("STATUS_CREATED");
});

pm.test("Check if res time is less than 100ms", function () {
    //too fast it should be failed
    pm.expect(pm.response.responseTime).to.be.below(100);
});

pm.test("Check if method is GET", function () {
    //run while the method POST is selected and should be failed
    pm.expect(pm.request.method).to.eql("GET");
});