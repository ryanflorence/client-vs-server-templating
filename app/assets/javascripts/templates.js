(function() {
  var template = Handlebars.template, templates = Handlebars.templates = Handlebars.templates || {};
templates['whatev'] = template(function (Handlebars,depth0,helpers,partials,data) {
  helpers = helpers || Handlebars.helpers;
  var buffer = "", stack1, foundHelper, self=this, functionType="function", helperMissing=helpers.helperMissing, undef=void 0, escapeExpression=this.escapeExpression;


  buffer += "<tr>\n  <td>";
  foundHelper = helpers.foo;
  stack1 = foundHelper || depth0.foo;
  if(typeof stack1 === functionType) { stack1 = stack1.call(depth0, { hash: {} }); }
  else if(stack1=== undef) { stack1 = helperMissing.call(depth0, "foo", { hash: {} }); }
  buffer += escapeExpression(stack1) + "</td>\n  <td>";
  foundHelper = helpers.bar;
  stack1 = foundHelper || depth0.bar;
  if(typeof stack1 === functionType) { stack1 = stack1.call(depth0, { hash: {} }); }
  else if(stack1=== undef) { stack1 = helperMissing.call(depth0, "bar", { hash: {} }); }
  buffer += escapeExpression(stack1) + "</td>\n  <td><a href=\"/whatevs/";
  foundHelper = helpers.id;
  stack1 = foundHelper || depth0.id;
  if(typeof stack1 === functionType) { stack1 = stack1.call(depth0, { hash: {} }); }
  else if(stack1=== undef) { stack1 = helperMissing.call(depth0, "id", { hash: {} }); }
  buffer += escapeExpression(stack1) + "\">Show</a></td>\n  <td><a href=\"/whatevs/";
  foundHelper = helpers.id;
  stack1 = foundHelper || depth0.id;
  if(typeof stack1 === functionType) { stack1 = stack1.call(depth0, { hash: {} }); }
  else if(stack1=== undef) { stack1 = helperMissing.call(depth0, "id", { hash: {} }); }
  buffer += escapeExpression(stack1) + "/edit\">Edit</a></td>\n  <td><a href=\"/whatevs/";
  foundHelper = helpers.id;
  stack1 = foundHelper || depth0.id;
  if(typeof stack1 === functionType) { stack1 = stack1.call(depth0, { hash: {} }); }
  else if(stack1=== undef) { stack1 = helperMissing.call(depth0, "id", { hash: {} }); }
  buffer += escapeExpression(stack1) + "\" data-confirm=\"Are you sure?\" data-method=\"delete\" rel=\"nofollow\">Destroy</a>\n</tr>\n\n";
  return buffer;});
templates['whatevs'] = template(function (Handlebars,depth0,helpers,partials,data) {
  helpers = helpers || Handlebars.helpers; partials = partials || Handlebars.partials;
  var buffer = "", stack1, stack2, foundHelper, tmp1, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n  ";
  stack1 = depth0;
  stack1 = self.invokePartial(partials.whatev, 'whatev', stack1, helpers, partials);;
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n";
  return buffer;}

  buffer += "<h1>Listing whatevs</h1>\n\n<table>\n  <tr>\n    <th>Foo</th>\n    <th>Bar</th>\n    <th></th>\n    <th></th>\n    <th></th>\n  </tr>\n\n";
  foundHelper = helpers.whatevs;
  stack1 = foundHelper || depth0.whatevs;
  stack2 = helpers.each;
  tmp1 = self.program(1, program1, data);
  tmp1.hash = {};
  tmp1.fn = tmp1;
  tmp1.inverse = self.noop;
  stack1 = stack2.call(depth0, stack1, tmp1);
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n</table>\n\n<br />\n\n<a href=\"/whatevs/new\">New Whatev</a>\n\n";
  return buffer;});
})();
Handlebars.registerPartial('whatev', Handlebars.templates.whatev)
