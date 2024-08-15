"use strict";
var __create = Object.create;
var __defProp = Object.defineProperty;
var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
var __getOwnPropNames = Object.getOwnPropertyNames;
var __getProtoOf = Object.getPrototypeOf;
var __hasOwnProp = Object.prototype.hasOwnProperty;
var __commonJS = (cb, mod) => function __require() {
  return mod || (0, cb[__getOwnPropNames(cb)[0]])((mod = { exports: {} }).exports, mod), mod.exports;
};
var __export = (target, all) => {
  for (var name in all)
    __defProp(target, name, { get: all[name], enumerable: true });
};
var __copyProps = (to, from, except, desc) => {
  if (from && typeof from === "object" || typeof from === "function") {
    for (let key of __getOwnPropNames(from))
      if (!__hasOwnProp.call(to, key) && key !== except)
        __defProp(to, key, { get: () => from[key], enumerable: !(desc = __getOwnPropDesc(from, key)) || desc.enumerable });
  }
  return to;
};
var __toESM = (mod, isNodeMode, target) => (target = mod != null ? __create(__getProtoOf(mod)) : {}, __copyProps(
  // If the importer is in node compatibility mode or this is not an ESM
  // file that has been converted to a CommonJS file using a Babel-
  // compatible transform (i.e. "__esModule" has not been set), then set
  // "default" to the CommonJS "module.exports" for node compatibility.
  isNodeMode || !mod || !mod.__esModule ? __defProp(target, "default", { value: mod, enumerable: true }) : target,
  mod
));
var __toCommonJS = (mod) => __copyProps(__defProp({}, "__esModule", { value: true }), mod);

// node_modules/jstoxml/dist/jstoxml.js
var require_jstoxml = __commonJS({
  "node_modules/jstoxml/dist/jstoxml.js"(exports2) {
    (function(global, factory) {
      if (typeof define === "function" && define.amd) {
        define(["exports"], factory);
      } else if (typeof exports2 !== "undefined") {
        factory(exports2);
      } else {
        var mod = {
          exports: {}
        };
        factory(mod.exports);
        global.jstoxml = mod.exports;
      }
    })(typeof globalThis !== "undefined" ? globalThis : typeof self !== "undefined" ? self : exports2, function(_exports) {
      "use strict";
      Object.defineProperty(_exports, "__esModule", {
        value: true
      });
      _exports.toXML = _exports.default = void 0;
      function _toConsumableArray(arr) {
        return _arrayWithoutHoles(arr) || _iterableToArray(arr) || _unsupportedIterableToArray(arr) || _nonIterableSpread();
      }
      function _nonIterableSpread() {
        throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.");
      }
      function _iterableToArray(iter) {
        if (typeof Symbol !== "undefined" && iter[Symbol.iterator] != null || iter["@@iterator"] != null)
          return Array.from(iter);
      }
      function _arrayWithoutHoles(arr) {
        if (Array.isArray(arr))
          return _arrayLikeToArray(arr);
      }
      function ownKeys(e, r) {
        var t = Object.keys(e);
        if (Object.getOwnPropertySymbols) {
          var o = Object.getOwnPropertySymbols(e);
          r && (o = o.filter(function(r2) {
            return Object.getOwnPropertyDescriptor(e, r2).enumerable;
          })), t.push.apply(t, o);
        }
        return t;
      }
      function _objectSpread(e) {
        for (var r = 1; r < arguments.length; r++) {
          var t = null != arguments[r] ? arguments[r] : {};
          r % 2 ? ownKeys(Object(t), true).forEach(function(r2) {
            _defineProperty(e, r2, t[r2]);
          }) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : ownKeys(Object(t)).forEach(function(r2) {
            Object.defineProperty(e, r2, Object.getOwnPropertyDescriptor(t, r2));
          });
        }
        return e;
      }
      function _defineProperty(obj, key, value) {
        key = _toPropertyKey(key);
        if (key in obj) {
          Object.defineProperty(obj, key, { value, enumerable: true, configurable: true, writable: true });
        } else {
          obj[key] = value;
        }
        return obj;
      }
      function _toPropertyKey(t) {
        var i = _toPrimitive(t, "string");
        return "symbol" == _typeof(i) ? i : String(i);
      }
      function _toPrimitive(t, r) {
        if ("object" != _typeof(t) || !t)
          return t;
        var e = t[Symbol.toPrimitive];
        if (void 0 !== e) {
          var i = e.call(t, r || "default");
          if ("object" != _typeof(i))
            return i;
          throw new TypeError("@@toPrimitive must return a primitive value.");
        }
        return ("string" === r ? String : Number)(t);
      }
      function _slicedToArray(arr, i) {
        return _arrayWithHoles(arr) || _iterableToArrayLimit(arr, i) || _unsupportedIterableToArray(arr, i) || _nonIterableRest();
      }
      function _nonIterableRest() {
        throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.");
      }
      function _unsupportedIterableToArray(o, minLen) {
        if (!o)
          return;
        if (typeof o === "string")
          return _arrayLikeToArray(o, minLen);
        var n2 = Object.prototype.toString.call(o).slice(8, -1);
        if (n2 === "Object" && o.constructor)
          n2 = o.constructor.name;
        if (n2 === "Map" || n2 === "Set")
          return Array.from(o);
        if (n2 === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n2))
          return _arrayLikeToArray(o, minLen);
      }
      function _arrayLikeToArray(arr, len) {
        if (len == null || len > arr.length)
          len = arr.length;
        for (var i = 0, arr2 = new Array(len); i < len; i++)
          arr2[i] = arr[i];
        return arr2;
      }
      function _iterableToArrayLimit(r, l2) {
        var t = null == r ? null : "undefined" != typeof Symbol && r[Symbol.iterator] || r["@@iterator"];
        if (null != t) {
          var e, n2, i, u, a = [], f = true, o = false;
          try {
            if (i = (t = t.call(r)).next, 0 === l2) {
              if (Object(t) !== t)
                return;
              f = false;
            } else
              for (; !(f = (e = i.call(t)).done) && (a.push(e.value), a.length !== l2); f = true)
                ;
          } catch (r2) {
            o = true, n2 = r2;
          } finally {
            try {
              if (!f && null != t.return && (u = t.return(), Object(u) !== u))
                return;
            } finally {
              if (o)
                throw n2;
            }
          }
          return a;
        }
      }
      function _arrayWithHoles(arr) {
        if (Array.isArray(arr))
          return arr;
      }
      function _typeof(o) {
        "@babel/helpers - typeof";
        return _typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(o2) {
          return typeof o2;
        } : function(o2) {
          return o2 && "function" == typeof Symbol && o2.constructor === Symbol && o2 !== Symbol.prototype ? "symbol" : typeof o2;
        }, _typeof(o);
      }
      var DATA_TYPES = {
        ARRAY: "array",
        BOOLEAN: "boolean",
        DATE: "date",
        FUNCTION: "function",
        JSTOXML_OBJECT: "jstoxml-object",
        NULL: "null",
        NUMBER: "number",
        OBJECT: "object",
        STRING: "string"
      };
      var PRIMITIVE_TYPES = [DATA_TYPES.STRING, DATA_TYPES.NUMBER, DATA_TYPES.BOOLEAN];
      var DEFAULT_XML_HEADER = '<?xml version="1.0" encoding="UTF-8"?>';
      var PRIVATE_VARS = ["_selfCloseTag", "_attrs"];
      var getIndentStr = function getIndentStr2() {
        var indent = arguments.length > 0 && arguments[0] !== void 0 ? arguments[0] : "";
        var depth = arguments.length > 1 && arguments[1] !== void 0 ? arguments[1] : 0;
        return indent.repeat(depth);
      };
      var getType = function getType2(val) {
        return Array.isArray(val) && DATA_TYPES.ARRAY || _typeof(val) === DATA_TYPES.OBJECT && val !== null && val._name && DATA_TYPES.JSTOXML_OBJECT || val instanceof Date && DATA_TYPES.DATE || val === null && DATA_TYPES.NULL || _typeof(val);
      };
      var isCDATA = function isCDATA2(str) {
        return str.startsWith("<![CDATA[");
      };
      var mapStr = function mapStr2() {
        var input = arguments.length > 0 && arguments[0] !== void 0 ? arguments[0] : "";
        var replacements = arguments.length > 1 && arguments[1] !== void 0 ? arguments[1] : {};
        var contentMap = arguments.length > 2 ? arguments[2] : void 0;
        var output = input;
        if (_typeof(input) === DATA_TYPES.STRING) {
          if (isCDATA(input)) {
            return input;
          }
          var regexp = new RegExp("(".concat(Object.keys(replacements).join("|"), ")(?!(\\w|#)*;)"), "g");
          output = String(input).replace(regexp, function(str, entity) {
            return replacements[entity] || "";
          });
        }
        return typeof contentMap === "function" ? contentMap(output) : output;
      };
      var getAttributeKeyVals = function getAttributeKeyVals2() {
        var attributes = arguments.length > 0 && arguments[0] !== void 0 ? arguments[0] : {};
        var replacements = arguments.length > 1 ? arguments[1] : void 0;
        var filter = arguments.length > 2 ? arguments[2] : void 0;
        var outputExplicitTrue = arguments.length > 3 ? arguments[3] : void 0;
        var attributesArr = Array.isArray(attributes) ? attributes : Object.entries(attributes).map(function(_ref) {
          var _ref2 = _slicedToArray(_ref, 2), key = _ref2[0], val = _ref2[1];
          return _defineProperty({}, key, val);
        });
        return attributesArr.reduce(function(allAttributes, attr) {
          var key = Object.keys(attr)[0];
          var val = attr[key];
          if (_typeof(filter) === DATA_TYPES.FUNCTION) {
            var shouldFilterOut = filter(key, val);
            if (shouldFilterOut) {
              return allAttributes;
            }
          }
          var replacedVal = replacements ? mapStr(val, replacements) : val;
          var valStr = !outputExplicitTrue && replacedVal === true ? "" : '="'.concat(replacedVal, '"');
          allAttributes.push("".concat(key).concat(valStr));
          return allAttributes;
        }, []);
      };
      var formatAttributes = function formatAttributes2() {
        var attributes = arguments.length > 0 && arguments[0] !== void 0 ? arguments[0] : {};
        var replacements = arguments.length > 1 ? arguments[1] : void 0;
        var filter = arguments.length > 2 ? arguments[2] : void 0;
        var outputExplicitTrue = arguments.length > 3 ? arguments[3] : void 0;
        var keyVals = getAttributeKeyVals(attributes, replacements, filter, outputExplicitTrue);
        if (keyVals.length === 0)
          return "";
        var keysValsJoined = keyVals.join(" ");
        return " ".concat(keysValsJoined);
      };
      var objToArray = function objToArray2() {
        var obj = arguments.length > 0 && arguments[0] !== void 0 ? arguments[0] : {};
        return Object.keys(obj).map(function(key) {
          return {
            _name: key,
            _content: obj[key]
          };
        });
      };
      var isPrimitive = function isPrimitive2(val) {
        return PRIMITIVE_TYPES.includes(getType(val));
      };
      var isSimpleXML = function isSimpleXML2(xmlStr) {
        return !xmlStr.match("<");
      };
      var getHeaderString = function getHeaderString2(_ref4) {
        var header = _ref4.header, isOutputStart = _ref4.isOutputStart;
        var shouldOutputHeader = header && isOutputStart;
        if (!shouldOutputHeader)
          return "";
        var shouldUseDefaultHeader = _typeof(header) === DATA_TYPES.BOOLEAN;
        return shouldUseDefaultHeader ? DEFAULT_XML_HEADER : header;
      };
      var defaultEntityReplacements = {
        "<": "&lt;",
        ">": "&gt;",
        "&": "&amp;",
        '"': "&quot;"
      };
      var toXML2 = _exports.toXML = function toXML3() {
        var obj = arguments.length > 0 && arguments[0] !== void 0 ? arguments[0] : {};
        var config = arguments.length > 1 && arguments[1] !== void 0 ? arguments[1] : {};
        var _config$depth = config.depth, depth = _config$depth === void 0 ? 0 : _config$depth, indent = config.indent, _isFirstItem = config._isFirstItem, _config$_isOutputStar = config._isOutputStart, _isOutputStart = _config$_isOutputStar === void 0 ? true : _config$_isOutputStar, header = config.header, _config$attributeRepl = config.attributeReplacements, rawAttributeReplacements = _config$attributeRepl === void 0 ? {} : _config$attributeRepl, attributeFilter = config.attributeFilter, _config$attributeExpl = config.attributeExplicitTrue, attributeExplicitTrue = _config$attributeExpl === void 0 ? false : _config$attributeExpl, _config$contentReplac = config.contentReplacements, rawContentReplacements = _config$contentReplac === void 0 ? {} : _config$contentReplac, contentMap = config.contentMap, _config$selfCloseTags = config.selfCloseTags, selfCloseTags = _config$selfCloseTags === void 0 ? true : _config$selfCloseTags;
        var shouldTurnOffAttributeReplacements = typeof rawAttributeReplacements === "boolean" && !rawAttributeReplacements;
        var attributeReplacements = shouldTurnOffAttributeReplacements ? {} : _objectSpread(_objectSpread({}, defaultEntityReplacements), rawAttributeReplacements);
        var shouldTurnOffContentReplacements = typeof rawContentReplacements === "boolean" && !rawContentReplacements;
        var contentReplacements = shouldTurnOffContentReplacements ? {} : _objectSpread(_objectSpread({}, defaultEntityReplacements), rawContentReplacements);
        var shouldAddNewlines = typeof indent === "string";
        var indentStr = getIndentStr(indent, depth);
        var valType = getType(obj);
        var headerStr = getHeaderString({
          header,
          indent,
          depth,
          isOutputStart: _isOutputStart
        });
        var isOutputStart = _isOutputStart && !headerStr && _isFirstItem && depth === 0;
        var preIndentStr = shouldAddNewlines && !isOutputStart ? "\n" : "";
        var outputStr = "";
        switch (valType) {
          case DATA_TYPES.JSTOXML_OBJECT: {
            var _name = obj._name, _content = obj._content;
            if (_content === null && typeof contentMap !== "function") {
              outputStr = "".concat(preIndentStr).concat(indentStr).concat(_name);
              break;
            }
            var isArrayOfPrimitives = Array.isArray(_content) && _content.every(isPrimitive);
            if (isArrayOfPrimitives) {
              var primitives = _content.map(function(a) {
                return toXML3({
                  _name,
                  _content: a
                }, _objectSpread(_objectSpread({}, config), {}, {
                  depth,
                  _isOutputStart: false
                }));
              });
              return primitives.join("");
            }
            if (PRIVATE_VARS.includes(_name))
              break;
            var newVal = toXML3(_content, _objectSpread(_objectSpread({}, config), {}, {
              depth: depth + 1,
              _isOutputStart: isOutputStart
            }));
            var newValType = getType(newVal);
            var isNewValSimple = isSimpleXML(newVal);
            var isNewValCDATA = isCDATA(newVal);
            var preTag = "".concat(preIndentStr).concat(indentStr);
            if (_name === "_comment") {
              outputStr += "".concat(preTag, "<!-- ").concat(_content, " -->");
              break;
            }
            var valIsEmpty = newValType === "undefined" || newVal === "";
            var globalSelfClose = selfCloseTags;
            var localSelfClose = obj._selfCloseTag;
            var shouldSelfClose = _typeof(localSelfClose) === DATA_TYPES.BOOLEAN ? valIsEmpty && localSelfClose : valIsEmpty && globalSelfClose;
            var selfCloseStr = shouldSelfClose ? "/" : "";
            var attributesString = formatAttributes(obj._attrs, attributeReplacements, attributeFilter, attributeExplicitTrue);
            var tag = "<".concat(_name).concat(attributesString).concat(selfCloseStr, ">");
            var preTagCloseStr = shouldAddNewlines && !isNewValSimple && !isNewValCDATA ? "\n".concat(indentStr) : "";
            var postTag = !shouldSelfClose ? "".concat(newVal).concat(preTagCloseStr, "</").concat(_name, ">") : "";
            outputStr += "".concat(preTag).concat(tag).concat(postTag);
            break;
          }
          case DATA_TYPES.OBJECT: {
            var keys = Object.keys(obj);
            var outputArr = keys.map(function(key, index) {
              var newConfig = _objectSpread(_objectSpread({}, config), {}, {
                _isFirstItem: index === 0,
                _isLastItem: index + 1 === keys.length,
                _isOutputStart: isOutputStart
              });
              var outputObj = {
                _name: key
              };
              if (getType(obj[key]) === DATA_TYPES.OBJECT) {
                PRIVATE_VARS.forEach(function(privateVar) {
                  var val = obj[key][privateVar];
                  if (typeof val !== "undefined") {
                    outputObj[privateVar] = val;
                    delete obj[key][privateVar];
                  }
                });
                var hasContent = typeof obj[key]._content !== "undefined";
                if (hasContent) {
                  if (Object.keys(obj[key]).length > 1) {
                    var newContentObj = Object.assign({}, obj[key]);
                    delete newContentObj._content;
                    outputObj._content = [].concat(_toConsumableArray(objToArray(newContentObj)), [obj[key]._content]);
                  }
                }
              }
              if (typeof outputObj._content === "undefined")
                outputObj._content = obj[key];
              var xml = toXML3(outputObj, newConfig);
              return xml;
            }, config);
            outputStr = outputArr.join("");
            break;
          }
          case DATA_TYPES.FUNCTION: {
            var fnResult = obj(config);
            outputStr = toXML3(fnResult, config);
            break;
          }
          case DATA_TYPES.ARRAY: {
            var _outputArr = obj.map(function(singleVal, index) {
              var newConfig = _objectSpread(_objectSpread({}, config), {}, {
                _isFirstItem: index === 0,
                _isLastItem: index + 1 === obj.length,
                _isOutputStart: isOutputStart
              });
              return toXML3(singleVal, newConfig);
            });
            outputStr = _outputArr.join("");
            break;
          }
          default: {
            outputStr = mapStr(obj, contentReplacements, contentMap);
            break;
          }
        }
        return "".concat(headerStr).concat(outputStr);
      };
      var _default = _exports.default = {
        toXML: toXML2
      };
    });
  }
});

// node_modules/qrcode-svg/lib/qrcode.js
var require_qrcode = __commonJS({
  "node_modules/qrcode-svg/lib/qrcode.js"(exports2, module2) {
    function QR8bitByte(data) {
      this.mode = QRMode.MODE_8BIT_BYTE;
      this.data = data;
      this.parsedData = [];
      for (var i2 = 0, l2 = this.data.length; i2 < l2; i2++) {
        var byteArray = [];
        var code = this.data.charCodeAt(i2);
        if (code > 65536) {
          byteArray[0] = 240 | (code & 1835008) >>> 18;
          byteArray[1] = 128 | (code & 258048) >>> 12;
          byteArray[2] = 128 | (code & 4032) >>> 6;
          byteArray[3] = 128 | code & 63;
        } else if (code > 2048) {
          byteArray[0] = 224 | (code & 61440) >>> 12;
          byteArray[1] = 128 | (code & 4032) >>> 6;
          byteArray[2] = 128 | code & 63;
        } else if (code > 128) {
          byteArray[0] = 192 | (code & 1984) >>> 6;
          byteArray[1] = 128 | code & 63;
        } else {
          byteArray[0] = code;
        }
        this.parsedData.push(byteArray);
      }
      this.parsedData = Array.prototype.concat.apply([], this.parsedData);
      if (this.parsedData.length != this.data.length) {
        this.parsedData.unshift(191);
        this.parsedData.unshift(187);
        this.parsedData.unshift(239);
      }
    }
    QR8bitByte.prototype = {
      getLength: function(buffer) {
        return this.parsedData.length;
      },
      write: function(buffer) {
        for (var i2 = 0, l2 = this.parsedData.length; i2 < l2; i2++) {
          buffer.put(this.parsedData[i2], 8);
        }
      }
    };
    function QRCodeModel(typeNumber, errorCorrectLevel) {
      this.typeNumber = typeNumber;
      this.errorCorrectLevel = errorCorrectLevel;
      this.modules = null;
      this.moduleCount = 0;
      this.dataCache = null;
      this.dataList = [];
    }
    QRCodeModel.prototype = { addData: function(data) {
      var newData = new QR8bitByte(data);
      this.dataList.push(newData);
      this.dataCache = null;
    }, isDark: function(row, col) {
      if (row < 0 || this.moduleCount <= row || col < 0 || this.moduleCount <= col) {
        throw new Error(row + "," + col);
      }
      return this.modules[row][col];
    }, getModuleCount: function() {
      return this.moduleCount;
    }, make: function() {
      this.makeImpl(false, this.getBestMaskPattern());
    }, makeImpl: function(test, maskPattern) {
      this.moduleCount = this.typeNumber * 4 + 17;
      this.modules = new Array(this.moduleCount);
      for (var row = 0; row < this.moduleCount; row++) {
        this.modules[row] = new Array(this.moduleCount);
        for (var col = 0; col < this.moduleCount; col++) {
          this.modules[row][col] = null;
        }
      }
      this.setupPositionProbePattern(0, 0);
      this.setupPositionProbePattern(this.moduleCount - 7, 0);
      this.setupPositionProbePattern(0, this.moduleCount - 7);
      this.setupPositionAdjustPattern();
      this.setupTimingPattern();
      this.setupTypeInfo(test, maskPattern);
      if (this.typeNumber >= 7) {
        this.setupTypeNumber(test);
      }
      if (this.dataCache == null) {
        this.dataCache = QRCodeModel.createData(this.typeNumber, this.errorCorrectLevel, this.dataList);
      }
      this.mapData(this.dataCache, maskPattern);
    }, setupPositionProbePattern: function(row, col) {
      for (var r = -1; r <= 7; r++) {
        if (row + r <= -1 || this.moduleCount <= row + r)
          continue;
        for (var c = -1; c <= 7; c++) {
          if (col + c <= -1 || this.moduleCount <= col + c)
            continue;
          if (0 <= r && r <= 6 && (c == 0 || c == 6) || 0 <= c && c <= 6 && (r == 0 || r == 6) || 2 <= r && r <= 4 && 2 <= c && c <= 4) {
            this.modules[row + r][col + c] = true;
          } else {
            this.modules[row + r][col + c] = false;
          }
        }
      }
    }, getBestMaskPattern: function() {
      var minLostPoint = 0;
      var pattern = 0;
      for (var i2 = 0; i2 < 8; i2++) {
        this.makeImpl(true, i2);
        var lostPoint = QRUtil.getLostPoint(this);
        if (i2 == 0 || minLostPoint > lostPoint) {
          minLostPoint = lostPoint;
          pattern = i2;
        }
      }
      return pattern;
    }, createMovieClip: function(target_mc, instance_name, depth) {
      var qr_mc = target_mc.createEmptyMovieClip(instance_name, depth);
      var cs = 1;
      this.make();
      for (var row = 0; row < this.modules.length; row++) {
        var y = row * cs;
        for (var col = 0; col < this.modules[row].length; col++) {
          var x = col * cs;
          var dark = this.modules[row][col];
          if (dark) {
            qr_mc.beginFill(0, 100);
            qr_mc.moveTo(x, y);
            qr_mc.lineTo(x + cs, y);
            qr_mc.lineTo(x + cs, y + cs);
            qr_mc.lineTo(x, y + cs);
            qr_mc.endFill();
          }
        }
      }
      return qr_mc;
    }, setupTimingPattern: function() {
      for (var r = 8; r < this.moduleCount - 8; r++) {
        if (this.modules[r][6] != null) {
          continue;
        }
        this.modules[r][6] = r % 2 == 0;
      }
      for (var c = 8; c < this.moduleCount - 8; c++) {
        if (this.modules[6][c] != null) {
          continue;
        }
        this.modules[6][c] = c % 2 == 0;
      }
    }, setupPositionAdjustPattern: function() {
      var pos = QRUtil.getPatternPosition(this.typeNumber);
      for (var i2 = 0; i2 < pos.length; i2++) {
        for (var j = 0; j < pos.length; j++) {
          var row = pos[i2];
          var col = pos[j];
          if (this.modules[row][col] != null) {
            continue;
          }
          for (var r = -2; r <= 2; r++) {
            for (var c = -2; c <= 2; c++) {
              if (r == -2 || r == 2 || c == -2 || c == 2 || r == 0 && c == 0) {
                this.modules[row + r][col + c] = true;
              } else {
                this.modules[row + r][col + c] = false;
              }
            }
          }
        }
      }
    }, setupTypeNumber: function(test) {
      var bits = QRUtil.getBCHTypeNumber(this.typeNumber);
      for (var i2 = 0; i2 < 18; i2++) {
        var mod = !test && (bits >> i2 & 1) == 1;
        this.modules[Math.floor(i2 / 3)][i2 % 3 + this.moduleCount - 8 - 3] = mod;
      }
      for (var i2 = 0; i2 < 18; i2++) {
        var mod = !test && (bits >> i2 & 1) == 1;
        this.modules[i2 % 3 + this.moduleCount - 8 - 3][Math.floor(i2 / 3)] = mod;
      }
    }, setupTypeInfo: function(test, maskPattern) {
      var data = this.errorCorrectLevel << 3 | maskPattern;
      var bits = QRUtil.getBCHTypeInfo(data);
      for (var i2 = 0; i2 < 15; i2++) {
        var mod = !test && (bits >> i2 & 1) == 1;
        if (i2 < 6) {
          this.modules[i2][8] = mod;
        } else if (i2 < 8) {
          this.modules[i2 + 1][8] = mod;
        } else {
          this.modules[this.moduleCount - 15 + i2][8] = mod;
        }
      }
      for (var i2 = 0; i2 < 15; i2++) {
        var mod = !test && (bits >> i2 & 1) == 1;
        if (i2 < 8) {
          this.modules[8][this.moduleCount - i2 - 1] = mod;
        } else if (i2 < 9) {
          this.modules[8][15 - i2 - 1 + 1] = mod;
        } else {
          this.modules[8][15 - i2 - 1] = mod;
        }
      }
      this.modules[this.moduleCount - 8][8] = !test;
    }, mapData: function(data, maskPattern) {
      var inc = -1;
      var row = this.moduleCount - 1;
      var bitIndex = 7;
      var byteIndex = 0;
      for (var col = this.moduleCount - 1; col > 0; col -= 2) {
        if (col == 6)
          col--;
        while (true) {
          for (var c = 0; c < 2; c++) {
            if (this.modules[row][col - c] == null) {
              var dark = false;
              if (byteIndex < data.length) {
                dark = (data[byteIndex] >>> bitIndex & 1) == 1;
              }
              var mask = QRUtil.getMask(maskPattern, row, col - c);
              if (mask) {
                dark = !dark;
              }
              this.modules[row][col - c] = dark;
              bitIndex--;
              if (bitIndex == -1) {
                byteIndex++;
                bitIndex = 7;
              }
            }
          }
          row += inc;
          if (row < 0 || this.moduleCount <= row) {
            row -= inc;
            inc = -inc;
            break;
          }
        }
      }
    } };
    QRCodeModel.PAD0 = 236;
    QRCodeModel.PAD1 = 17;
    QRCodeModel.createData = function(typeNumber, errorCorrectLevel, dataList) {
      var rsBlocks = QRRSBlock.getRSBlocks(typeNumber, errorCorrectLevel);
      var buffer = new QRBitBuffer();
      for (var i2 = 0; i2 < dataList.length; i2++) {
        var data = dataList[i2];
        buffer.put(data.mode, 4);
        buffer.put(data.getLength(), QRUtil.getLengthInBits(data.mode, typeNumber));
        data.write(buffer);
      }
      var totalDataCount = 0;
      for (var i2 = 0; i2 < rsBlocks.length; i2++) {
        totalDataCount += rsBlocks[i2].dataCount;
      }
      if (buffer.getLengthInBits() > totalDataCount * 8) {
        throw new Error("code length overflow. (" + buffer.getLengthInBits() + ">" + totalDataCount * 8 + ")");
      }
      if (buffer.getLengthInBits() + 4 <= totalDataCount * 8) {
        buffer.put(0, 4);
      }
      while (buffer.getLengthInBits() % 8 != 0) {
        buffer.putBit(false);
      }
      while (true) {
        if (buffer.getLengthInBits() >= totalDataCount * 8) {
          break;
        }
        buffer.put(QRCodeModel.PAD0, 8);
        if (buffer.getLengthInBits() >= totalDataCount * 8) {
          break;
        }
        buffer.put(QRCodeModel.PAD1, 8);
      }
      return QRCodeModel.createBytes(buffer, rsBlocks);
    };
    QRCodeModel.createBytes = function(buffer, rsBlocks) {
      var offset2 = 0;
      var maxDcCount = 0;
      var maxEcCount = 0;
      var dcdata = new Array(rsBlocks.length);
      var ecdata = new Array(rsBlocks.length);
      for (var r = 0; r < rsBlocks.length; r++) {
        var dcCount = rsBlocks[r].dataCount;
        var ecCount = rsBlocks[r].totalCount - dcCount;
        maxDcCount = Math.max(maxDcCount, dcCount);
        maxEcCount = Math.max(maxEcCount, ecCount);
        dcdata[r] = new Array(dcCount);
        for (var i2 = 0; i2 < dcdata[r].length; i2++) {
          dcdata[r][i2] = 255 & buffer.buffer[i2 + offset2];
        }
        offset2 += dcCount;
        var rsPoly = QRUtil.getErrorCorrectPolynomial(ecCount);
        var rawPoly = new QRPolynomial(dcdata[r], rsPoly.getLength() - 1);
        var modPoly = rawPoly.mod(rsPoly);
        ecdata[r] = new Array(rsPoly.getLength() - 1);
        for (var i2 = 0; i2 < ecdata[r].length; i2++) {
          var modIndex = i2 + modPoly.getLength() - ecdata[r].length;
          ecdata[r][i2] = modIndex >= 0 ? modPoly.get(modIndex) : 0;
        }
      }
      var totalCodeCount = 0;
      for (var i2 = 0; i2 < rsBlocks.length; i2++) {
        totalCodeCount += rsBlocks[i2].totalCount;
      }
      var data = new Array(totalCodeCount);
      var index = 0;
      for (var i2 = 0; i2 < maxDcCount; i2++) {
        for (var r = 0; r < rsBlocks.length; r++) {
          if (i2 < dcdata[r].length) {
            data[index++] = dcdata[r][i2];
          }
        }
      }
      for (var i2 = 0; i2 < maxEcCount; i2++) {
        for (var r = 0; r < rsBlocks.length; r++) {
          if (i2 < ecdata[r].length) {
            data[index++] = ecdata[r][i2];
          }
        }
      }
      return data;
    };
    var QRMode = { MODE_NUMBER: 1 << 0, MODE_ALPHA_NUM: 1 << 1, MODE_8BIT_BYTE: 1 << 2, MODE_KANJI: 1 << 3 };
    var QRErrorCorrectLevel = { L: 1, M: 0, Q: 3, H: 2 };
    var QRMaskPattern = { PATTERN000: 0, PATTERN001: 1, PATTERN010: 2, PATTERN011: 3, PATTERN100: 4, PATTERN101: 5, PATTERN110: 6, PATTERN111: 7 };
    var QRUtil = { PATTERN_POSITION_TABLE: [[], [6, 18], [6, 22], [6, 26], [6, 30], [6, 34], [6, 22, 38], [6, 24, 42], [6, 26, 46], [6, 28, 50], [6, 30, 54], [6, 32, 58], [6, 34, 62], [6, 26, 46, 66], [6, 26, 48, 70], [6, 26, 50, 74], [6, 30, 54, 78], [6, 30, 56, 82], [6, 30, 58, 86], [6, 34, 62, 90], [6, 28, 50, 72, 94], [6, 26, 50, 74, 98], [6, 30, 54, 78, 102], [6, 28, 54, 80, 106], [6, 32, 58, 84, 110], [6, 30, 58, 86, 114], [6, 34, 62, 90, 118], [6, 26, 50, 74, 98, 122], [6, 30, 54, 78, 102, 126], [6, 26, 52, 78, 104, 130], [6, 30, 56, 82, 108, 134], [6, 34, 60, 86, 112, 138], [6, 30, 58, 86, 114, 142], [6, 34, 62, 90, 118, 146], [6, 30, 54, 78, 102, 126, 150], [6, 24, 50, 76, 102, 128, 154], [6, 28, 54, 80, 106, 132, 158], [6, 32, 58, 84, 110, 136, 162], [6, 26, 54, 82, 110, 138, 166], [6, 30, 58, 86, 114, 142, 170]], G15: 1 << 10 | 1 << 8 | 1 << 5 | 1 << 4 | 1 << 2 | 1 << 1 | 1 << 0, G18: 1 << 12 | 1 << 11 | 1 << 10 | 1 << 9 | 1 << 8 | 1 << 5 | 1 << 2 | 1 << 0, G15_MASK: 1 << 14 | 1 << 12 | 1 << 10 | 1 << 4 | 1 << 1, getBCHTypeInfo: function(data) {
      var d = data << 10;
      while (QRUtil.getBCHDigit(d) - QRUtil.getBCHDigit(QRUtil.G15) >= 0) {
        d ^= QRUtil.G15 << QRUtil.getBCHDigit(d) - QRUtil.getBCHDigit(QRUtil.G15);
      }
      return (data << 10 | d) ^ QRUtil.G15_MASK;
    }, getBCHTypeNumber: function(data) {
      var d = data << 12;
      while (QRUtil.getBCHDigit(d) - QRUtil.getBCHDigit(QRUtil.G18) >= 0) {
        d ^= QRUtil.G18 << QRUtil.getBCHDigit(d) - QRUtil.getBCHDigit(QRUtil.G18);
      }
      return data << 12 | d;
    }, getBCHDigit: function(data) {
      var digit = 0;
      while (data != 0) {
        digit++;
        data >>>= 1;
      }
      return digit;
    }, getPatternPosition: function(typeNumber) {
      return QRUtil.PATTERN_POSITION_TABLE[typeNumber - 1];
    }, getMask: function(maskPattern, i2, j) {
      switch (maskPattern) {
        case QRMaskPattern.PATTERN000:
          return (i2 + j) % 2 == 0;
        case QRMaskPattern.PATTERN001:
          return i2 % 2 == 0;
        case QRMaskPattern.PATTERN010:
          return j % 3 == 0;
        case QRMaskPattern.PATTERN011:
          return (i2 + j) % 3 == 0;
        case QRMaskPattern.PATTERN100:
          return (Math.floor(i2 / 2) + Math.floor(j / 3)) % 2 == 0;
        case QRMaskPattern.PATTERN101:
          return i2 * j % 2 + i2 * j % 3 == 0;
        case QRMaskPattern.PATTERN110:
          return (i2 * j % 2 + i2 * j % 3) % 2 == 0;
        case QRMaskPattern.PATTERN111:
          return (i2 * j % 3 + (i2 + j) % 2) % 2 == 0;
        default:
          throw new Error("bad maskPattern:" + maskPattern);
      }
    }, getErrorCorrectPolynomial: function(errorCorrectLength) {
      var a = new QRPolynomial([1], 0);
      for (var i2 = 0; i2 < errorCorrectLength; i2++) {
        a = a.multiply(new QRPolynomial([1, QRMath.gexp(i2)], 0));
      }
      return a;
    }, getLengthInBits: function(mode, type) {
      if (1 <= type && type < 10) {
        switch (mode) {
          case QRMode.MODE_NUMBER:
            return 10;
          case QRMode.MODE_ALPHA_NUM:
            return 9;
          case QRMode.MODE_8BIT_BYTE:
            return 8;
          case QRMode.MODE_KANJI:
            return 8;
          default:
            throw new Error("mode:" + mode);
        }
      } else if (type < 27) {
        switch (mode) {
          case QRMode.MODE_NUMBER:
            return 12;
          case QRMode.MODE_ALPHA_NUM:
            return 11;
          case QRMode.MODE_8BIT_BYTE:
            return 16;
          case QRMode.MODE_KANJI:
            return 10;
          default:
            throw new Error("mode:" + mode);
        }
      } else if (type < 41) {
        switch (mode) {
          case QRMode.MODE_NUMBER:
            return 14;
          case QRMode.MODE_ALPHA_NUM:
            return 13;
          case QRMode.MODE_8BIT_BYTE:
            return 16;
          case QRMode.MODE_KANJI:
            return 12;
          default:
            throw new Error("mode:" + mode);
        }
      } else {
        throw new Error("type:" + type);
      }
    }, getLostPoint: function(qrCode) {
      var moduleCount = qrCode.getModuleCount();
      var lostPoint = 0;
      for (var row = 0; row < moduleCount; row++) {
        for (var col = 0; col < moduleCount; col++) {
          var sameCount = 0;
          var dark = qrCode.isDark(row, col);
          for (var r = -1; r <= 1; r++) {
            if (row + r < 0 || moduleCount <= row + r) {
              continue;
            }
            for (var c = -1; c <= 1; c++) {
              if (col + c < 0 || moduleCount <= col + c) {
                continue;
              }
              if (r == 0 && c == 0) {
                continue;
              }
              if (dark == qrCode.isDark(row + r, col + c)) {
                sameCount++;
              }
            }
          }
          if (sameCount > 5) {
            lostPoint += 3 + sameCount - 5;
          }
        }
      }
      for (var row = 0; row < moduleCount - 1; row++) {
        for (var col = 0; col < moduleCount - 1; col++) {
          var count = 0;
          if (qrCode.isDark(row, col))
            count++;
          if (qrCode.isDark(row + 1, col))
            count++;
          if (qrCode.isDark(row, col + 1))
            count++;
          if (qrCode.isDark(row + 1, col + 1))
            count++;
          if (count == 0 || count == 4) {
            lostPoint += 3;
          }
        }
      }
      for (var row = 0; row < moduleCount; row++) {
        for (var col = 0; col < moduleCount - 6; col++) {
          if (qrCode.isDark(row, col) && !qrCode.isDark(row, col + 1) && qrCode.isDark(row, col + 2) && qrCode.isDark(row, col + 3) && qrCode.isDark(row, col + 4) && !qrCode.isDark(row, col + 5) && qrCode.isDark(row, col + 6)) {
            lostPoint += 40;
          }
        }
      }
      for (var col = 0; col < moduleCount; col++) {
        for (var row = 0; row < moduleCount - 6; row++) {
          if (qrCode.isDark(row, col) && !qrCode.isDark(row + 1, col) && qrCode.isDark(row + 2, col) && qrCode.isDark(row + 3, col) && qrCode.isDark(row + 4, col) && !qrCode.isDark(row + 5, col) && qrCode.isDark(row + 6, col)) {
            lostPoint += 40;
          }
        }
      }
      var darkCount = 0;
      for (var col = 0; col < moduleCount; col++) {
        for (var row = 0; row < moduleCount; row++) {
          if (qrCode.isDark(row, col)) {
            darkCount++;
          }
        }
      }
      var ratio = Math.abs(100 * darkCount / moduleCount / moduleCount - 50) / 5;
      lostPoint += ratio * 10;
      return lostPoint;
    } };
    var QRMath = { glog: function(n2) {
      if (n2 < 1) {
        throw new Error("glog(" + n2 + ")");
      }
      return QRMath.LOG_TABLE[n2];
    }, gexp: function(n2) {
      while (n2 < 0) {
        n2 += 255;
      }
      while (n2 >= 256) {
        n2 -= 255;
      }
      return QRMath.EXP_TABLE[n2];
    }, EXP_TABLE: new Array(256), LOG_TABLE: new Array(256) };
    for (i = 0; i < 8; i++) {
      QRMath.EXP_TABLE[i] = 1 << i;
    }
    var i;
    for (i = 8; i < 256; i++) {
      QRMath.EXP_TABLE[i] = QRMath.EXP_TABLE[i - 4] ^ QRMath.EXP_TABLE[i - 5] ^ QRMath.EXP_TABLE[i - 6] ^ QRMath.EXP_TABLE[i - 8];
    }
    var i;
    for (i = 0; i < 255; i++) {
      QRMath.LOG_TABLE[QRMath.EXP_TABLE[i]] = i;
    }
    var i;
    function QRPolynomial(num, shift) {
      if (num.length == void 0) {
        throw new Error(num.length + "/" + shift);
      }
      var offset2 = 0;
      while (offset2 < num.length && num[offset2] == 0) {
        offset2++;
      }
      this.num = new Array(num.length - offset2 + shift);
      for (var i2 = 0; i2 < num.length - offset2; i2++) {
        this.num[i2] = num[i2 + offset2];
      }
    }
    QRPolynomial.prototype = { get: function(index) {
      return this.num[index];
    }, getLength: function() {
      return this.num.length;
    }, multiply: function(e) {
      var num = new Array(this.getLength() + e.getLength() - 1);
      for (var i2 = 0; i2 < this.getLength(); i2++) {
        for (var j = 0; j < e.getLength(); j++) {
          num[i2 + j] ^= QRMath.gexp(QRMath.glog(this.get(i2)) + QRMath.glog(e.get(j)));
        }
      }
      return new QRPolynomial(num, 0);
    }, mod: function(e) {
      if (this.getLength() - e.getLength() < 0) {
        return this;
      }
      var ratio = QRMath.glog(this.get(0)) - QRMath.glog(e.get(0));
      var num = new Array(this.getLength());
      for (var i2 = 0; i2 < this.getLength(); i2++) {
        num[i2] = this.get(i2);
      }
      for (var i2 = 0; i2 < e.getLength(); i2++) {
        num[i2] ^= QRMath.gexp(QRMath.glog(e.get(i2)) + ratio);
      }
      return new QRPolynomial(num, 0).mod(e);
    } };
    function QRRSBlock(totalCount, dataCount) {
      this.totalCount = totalCount;
      this.dataCount = dataCount;
    }
    QRRSBlock.RS_BLOCK_TABLE = [[1, 26, 19], [1, 26, 16], [1, 26, 13], [1, 26, 9], [1, 44, 34], [1, 44, 28], [1, 44, 22], [1, 44, 16], [1, 70, 55], [1, 70, 44], [2, 35, 17], [2, 35, 13], [1, 100, 80], [2, 50, 32], [2, 50, 24], [4, 25, 9], [1, 134, 108], [2, 67, 43], [2, 33, 15, 2, 34, 16], [2, 33, 11, 2, 34, 12], [2, 86, 68], [4, 43, 27], [4, 43, 19], [4, 43, 15], [2, 98, 78], [4, 49, 31], [2, 32, 14, 4, 33, 15], [4, 39, 13, 1, 40, 14], [2, 121, 97], [2, 60, 38, 2, 61, 39], [4, 40, 18, 2, 41, 19], [4, 40, 14, 2, 41, 15], [2, 146, 116], [3, 58, 36, 2, 59, 37], [4, 36, 16, 4, 37, 17], [4, 36, 12, 4, 37, 13], [2, 86, 68, 2, 87, 69], [4, 69, 43, 1, 70, 44], [6, 43, 19, 2, 44, 20], [6, 43, 15, 2, 44, 16], [4, 101, 81], [1, 80, 50, 4, 81, 51], [4, 50, 22, 4, 51, 23], [3, 36, 12, 8, 37, 13], [2, 116, 92, 2, 117, 93], [6, 58, 36, 2, 59, 37], [4, 46, 20, 6, 47, 21], [7, 42, 14, 4, 43, 15], [4, 133, 107], [8, 59, 37, 1, 60, 38], [8, 44, 20, 4, 45, 21], [12, 33, 11, 4, 34, 12], [3, 145, 115, 1, 146, 116], [4, 64, 40, 5, 65, 41], [11, 36, 16, 5, 37, 17], [11, 36, 12, 5, 37, 13], [5, 109, 87, 1, 110, 88], [5, 65, 41, 5, 66, 42], [5, 54, 24, 7, 55, 25], [11, 36, 12], [5, 122, 98, 1, 123, 99], [7, 73, 45, 3, 74, 46], [15, 43, 19, 2, 44, 20], [3, 45, 15, 13, 46, 16], [1, 135, 107, 5, 136, 108], [10, 74, 46, 1, 75, 47], [1, 50, 22, 15, 51, 23], [2, 42, 14, 17, 43, 15], [5, 150, 120, 1, 151, 121], [9, 69, 43, 4, 70, 44], [17, 50, 22, 1, 51, 23], [2, 42, 14, 19, 43, 15], [3, 141, 113, 4, 142, 114], [3, 70, 44, 11, 71, 45], [17, 47, 21, 4, 48, 22], [9, 39, 13, 16, 40, 14], [3, 135, 107, 5, 136, 108], [3, 67, 41, 13, 68, 42], [15, 54, 24, 5, 55, 25], [15, 43, 15, 10, 44, 16], [4, 144, 116, 4, 145, 117], [17, 68, 42], [17, 50, 22, 6, 51, 23], [19, 46, 16, 6, 47, 17], [2, 139, 111, 7, 140, 112], [17, 74, 46], [7, 54, 24, 16, 55, 25], [34, 37, 13], [4, 151, 121, 5, 152, 122], [4, 75, 47, 14, 76, 48], [11, 54, 24, 14, 55, 25], [16, 45, 15, 14, 46, 16], [6, 147, 117, 4, 148, 118], [6, 73, 45, 14, 74, 46], [11, 54, 24, 16, 55, 25], [30, 46, 16, 2, 47, 17], [8, 132, 106, 4, 133, 107], [8, 75, 47, 13, 76, 48], [7, 54, 24, 22, 55, 25], [22, 45, 15, 13, 46, 16], [10, 142, 114, 2, 143, 115], [19, 74, 46, 4, 75, 47], [28, 50, 22, 6, 51, 23], [33, 46, 16, 4, 47, 17], [8, 152, 122, 4, 153, 123], [22, 73, 45, 3, 74, 46], [8, 53, 23, 26, 54, 24], [12, 45, 15, 28, 46, 16], [3, 147, 117, 10, 148, 118], [3, 73, 45, 23, 74, 46], [4, 54, 24, 31, 55, 25], [11, 45, 15, 31, 46, 16], [7, 146, 116, 7, 147, 117], [21, 73, 45, 7, 74, 46], [1, 53, 23, 37, 54, 24], [19, 45, 15, 26, 46, 16], [5, 145, 115, 10, 146, 116], [19, 75, 47, 10, 76, 48], [15, 54, 24, 25, 55, 25], [23, 45, 15, 25, 46, 16], [13, 145, 115, 3, 146, 116], [2, 74, 46, 29, 75, 47], [42, 54, 24, 1, 55, 25], [23, 45, 15, 28, 46, 16], [17, 145, 115], [10, 74, 46, 23, 75, 47], [10, 54, 24, 35, 55, 25], [19, 45, 15, 35, 46, 16], [17, 145, 115, 1, 146, 116], [14, 74, 46, 21, 75, 47], [29, 54, 24, 19, 55, 25], [11, 45, 15, 46, 46, 16], [13, 145, 115, 6, 146, 116], [14, 74, 46, 23, 75, 47], [44, 54, 24, 7, 55, 25], [59, 46, 16, 1, 47, 17], [12, 151, 121, 7, 152, 122], [12, 75, 47, 26, 76, 48], [39, 54, 24, 14, 55, 25], [22, 45, 15, 41, 46, 16], [6, 151, 121, 14, 152, 122], [6, 75, 47, 34, 76, 48], [46, 54, 24, 10, 55, 25], [2, 45, 15, 64, 46, 16], [17, 152, 122, 4, 153, 123], [29, 74, 46, 14, 75, 47], [49, 54, 24, 10, 55, 25], [24, 45, 15, 46, 46, 16], [4, 152, 122, 18, 153, 123], [13, 74, 46, 32, 75, 47], [48, 54, 24, 14, 55, 25], [42, 45, 15, 32, 46, 16], [20, 147, 117, 4, 148, 118], [40, 75, 47, 7, 76, 48], [43, 54, 24, 22, 55, 25], [10, 45, 15, 67, 46, 16], [19, 148, 118, 6, 149, 119], [18, 75, 47, 31, 76, 48], [34, 54, 24, 34, 55, 25], [20, 45, 15, 61, 46, 16]];
    QRRSBlock.getRSBlocks = function(typeNumber, errorCorrectLevel) {
      var rsBlock = QRRSBlock.getRsBlockTable(typeNumber, errorCorrectLevel);
      if (rsBlock == void 0) {
        throw new Error("bad rs block @ typeNumber:" + typeNumber + "/errorCorrectLevel:" + errorCorrectLevel);
      }
      var length = rsBlock.length / 3;
      var list = [];
      for (var i2 = 0; i2 < length; i2++) {
        var count = rsBlock[i2 * 3 + 0];
        var totalCount = rsBlock[i2 * 3 + 1];
        var dataCount = rsBlock[i2 * 3 + 2];
        for (var j = 0; j < count; j++) {
          list.push(new QRRSBlock(totalCount, dataCount));
        }
      }
      return list;
    };
    QRRSBlock.getRsBlockTable = function(typeNumber, errorCorrectLevel) {
      switch (errorCorrectLevel) {
        case QRErrorCorrectLevel.L:
          return QRRSBlock.RS_BLOCK_TABLE[(typeNumber - 1) * 4 + 0];
        case QRErrorCorrectLevel.M:
          return QRRSBlock.RS_BLOCK_TABLE[(typeNumber - 1) * 4 + 1];
        case QRErrorCorrectLevel.Q:
          return QRRSBlock.RS_BLOCK_TABLE[(typeNumber - 1) * 4 + 2];
        case QRErrorCorrectLevel.H:
          return QRRSBlock.RS_BLOCK_TABLE[(typeNumber - 1) * 4 + 3];
        default:
          return void 0;
      }
    };
    function QRBitBuffer() {
      this.buffer = [];
      this.length = 0;
    }
    QRBitBuffer.prototype = { get: function(index) {
      var bufIndex = Math.floor(index / 8);
      return (this.buffer[bufIndex] >>> 7 - index % 8 & 1) == 1;
    }, put: function(num, length) {
      for (var i2 = 0; i2 < length; i2++) {
        this.putBit((num >>> length - i2 - 1 & 1) == 1);
      }
    }, getLengthInBits: function() {
      return this.length;
    }, putBit: function(bit) {
      var bufIndex = Math.floor(this.length / 8);
      if (this.buffer.length <= bufIndex) {
        this.buffer.push(0);
      }
      if (bit) {
        this.buffer[bufIndex] |= 128 >>> this.length % 8;
      }
      this.length++;
    } };
    var QRCodeLimitLength = [[17, 14, 11, 7], [32, 26, 20, 14], [53, 42, 32, 24], [78, 62, 46, 34], [106, 84, 60, 44], [134, 106, 74, 58], [154, 122, 86, 64], [192, 152, 108, 84], [230, 180, 130, 98], [271, 213, 151, 119], [321, 251, 177, 137], [367, 287, 203, 155], [425, 331, 241, 177], [458, 362, 258, 194], [520, 412, 292, 220], [586, 450, 322, 250], [644, 504, 364, 280], [718, 560, 394, 310], [792, 624, 442, 338], [858, 666, 482, 382], [929, 711, 509, 403], [1003, 779, 565, 439], [1091, 857, 611, 461], [1171, 911, 661, 511], [1273, 997, 715, 535], [1367, 1059, 751, 593], [1465, 1125, 805, 625], [1528, 1190, 868, 658], [1628, 1264, 908, 698], [1732, 1370, 982, 742], [1840, 1452, 1030, 790], [1952, 1538, 1112, 842], [2068, 1628, 1168, 898], [2188, 1722, 1228, 958], [2303, 1809, 1283, 983], [2431, 1911, 1351, 1051], [2563, 1989, 1423, 1093], [2699, 2099, 1499, 1139], [2809, 2213, 1579, 1219], [2953, 2331, 1663, 1273]];
    function QRCode2(options) {
      var instance = this;
      this.options = {
        padding: 4,
        width: 256,
        height: 256,
        typeNumber: 4,
        color: "#000000",
        background: "#ffffff",
        ecl: "M"
      };
      if (typeof options === "string") {
        options = {
          content: options
        };
      }
      if (options) {
        for (var i2 in options) {
          this.options[i2] = options[i2];
        }
      }
      if (typeof this.options.content !== "string") {
        throw new Error("Expected 'content' as string!");
      }
      if (this.options.content.length === 0) {
        throw new Error("Expected 'content' to be non-empty!");
      }
      if (!(this.options.padding >= 0)) {
        throw new Error("Expected 'padding' value to be non-negative!");
      }
      if (!(this.options.width > 0) || !(this.options.height > 0)) {
        throw new Error("Expected 'width' or 'height' value to be higher than zero!");
      }
      function _getErrorCorrectLevel(ecl2) {
        switch (ecl2) {
          case "L":
            return QRErrorCorrectLevel.L;
          case "M":
            return QRErrorCorrectLevel.M;
          case "Q":
            return QRErrorCorrectLevel.Q;
          case "H":
            return QRErrorCorrectLevel.H;
          default:
            throw new Error("Unknwon error correction level: " + ecl2);
        }
      }
      function _getTypeNumber(content2, ecl2) {
        var length = _getUTF8Length(content2);
        var type2 = 1;
        var limit = 0;
        for (var i3 = 0, len = QRCodeLimitLength.length; i3 <= len; i3++) {
          var table = QRCodeLimitLength[i3];
          if (!table) {
            throw new Error("Content too long: expected " + limit + " but got " + length);
          }
          switch (ecl2) {
            case "L":
              limit = table[0];
              break;
            case "M":
              limit = table[1];
              break;
            case "Q":
              limit = table[2];
              break;
            case "H":
              limit = table[3];
              break;
            default:
              throw new Error("Unknwon error correction level: " + ecl2);
          }
          if (length <= limit) {
            break;
          }
          type2++;
        }
        if (type2 > QRCodeLimitLength.length) {
          throw new Error("Content too long");
        }
        return type2;
      }
      function _getUTF8Length(content2) {
        var result = encodeURI(content2).toString().replace(/\%[0-9a-fA-F]{2}/g, "a");
        return result.length + (result.length != content2 ? 3 : 0);
      }
      var content = this.options.content;
      var type = _getTypeNumber(content, this.options.ecl);
      var ecl = _getErrorCorrectLevel(this.options.ecl);
      this.qrcode = new QRCodeModel(type, ecl);
      this.qrcode.addData(content);
      this.qrcode.make();
    }
    QRCode2.prototype.svg = function(opt) {
      var options = this.options || {};
      var modules = this.qrcode.modules;
      if (typeof opt == "undefined") {
        opt = { container: options.container || "svg" };
      }
      var pretty = typeof options.pretty != "undefined" ? !!options.pretty : true;
      var indent = pretty ? "  " : "";
      var EOL = pretty ? "\r\n" : "";
      var width = options.width;
      var height = options.height;
      var length = modules.length;
      var xsize = width / (length + 2 * options.padding);
      var ysize = height / (length + 2 * options.padding);
      var join = typeof options.join != "undefined" ? !!options.join : false;
      var swap = typeof options.swap != "undefined" ? !!options.swap : false;
      var xmlDeclaration = typeof options.xmlDeclaration != "undefined" ? !!options.xmlDeclaration : true;
      var predefined = typeof options.predefined != "undefined" ? !!options.predefined : false;
      var defs = predefined ? indent + '<defs><path id="qrmodule" d="M0 0 h' + ysize + " v" + xsize + ' H0 z" style="fill:' + options.color + ';shape-rendering:crispEdges;" /></defs>' + EOL : "";
      var bgrect = indent + '<rect x="0" y="0" width="' + width + '" height="' + height + '" style="fill:' + options.background + ';shape-rendering:crispEdges;"/>' + EOL;
      var modrect = "";
      var pathdata = "";
      for (var y = 0; y < length; y++) {
        for (var x = 0; x < length; x++) {
          var module3 = modules[x][y];
          if (module3) {
            var px = x * xsize + options.padding * xsize;
            var py = y * ysize + options.padding * ysize;
            if (swap) {
              var t = px;
              px = py;
              py = t;
            }
            if (join) {
              var w = xsize + px;
              var h = ysize + py;
              px = Number.isInteger(px) ? Number(px) : px.toFixed(2);
              py = Number.isInteger(py) ? Number(py) : py.toFixed(2);
              w = Number.isInteger(w) ? Number(w) : w.toFixed(2);
              h = Number.isInteger(h) ? Number(h) : h.toFixed(2);
              pathdata += "M" + px + "," + py + " V" + h + " H" + w + " V" + py + " H" + px + " Z ";
            } else if (predefined) {
              modrect += indent + '<use x="' + px.toString() + '" y="' + py.toString() + '" href="#qrmodule" />' + EOL;
            } else {
              modrect += indent + '<rect x="' + px.toString() + '" y="' + py.toString() + '" width="' + xsize + '" height="' + ysize + '" style="fill:' + options.color + ';shape-rendering:crispEdges;"/>' + EOL;
            }
          }
        }
      }
      if (join) {
        modrect = indent + '<path x="0" y="0" style="fill:' + options.color + ';shape-rendering:crispEdges;" d="' + pathdata + '" />';
      }
      var svg = "";
      switch (opt.container) {
        case "svg":
          if (xmlDeclaration) {
            svg += '<?xml version="1.0" standalone="yes"?>' + EOL;
          }
          svg += '<svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="' + width + '" height="' + height + '">' + EOL;
          svg += defs + bgrect + modrect;
          svg += "</svg>";
          break;
        case "svg-viewbox":
          if (xmlDeclaration) {
            svg += '<?xml version="1.0" standalone="yes"?>' + EOL;
          }
          svg += '<svg xmlns="http://www.w3.org/2000/svg" version="1.1" viewBox="0 0 ' + width + " " + height + '">' + EOL;
          svg += defs + bgrect + modrect;
          svg += "</svg>";
          break;
        case "g":
          svg += '<g width="' + width + '" height="' + height + '">' + EOL;
          svg += defs + bgrect + modrect;
          svg += "</g>";
          break;
        default:
          svg += (defs + bgrect + modrect).replace(/^\s+/, "");
          break;
      }
      return svg;
    };
    QRCode2.prototype.save = function(file, callback) {
      var data = this.svg();
      if (typeof callback != "function") {
        callback = function(error2, result) {
        };
      }
      try {
        var fs = require("fs");
        fs.writeFile(file, data, callback);
      } catch (e) {
        callback(e);
      }
    };
    if (typeof module2 != "undefined") {
      module2.exports = QRCode2;
    }
  }
});

// src/index.js
var src_exports = {};
__export(src_exports, {
  JSON_MIME: () => JSON_MIME,
  TXT_MIME: () => TXT_MIME,
  api: () => api,
  getS3Key: () => getS3Key,
  validateRenderParams: () => validateRenderParams
});
module.exports = __toCommonJS(src_exports);
var import_sharp = __toESM(require("sharp"), 1);
var import_stream2 = require("stream");

// node_modules/luxon/src/errors.js
var LuxonError = class extends Error {
};
var InvalidDateTimeError = class extends LuxonError {
  constructor(reason) {
    super(`Invalid DateTime: ${reason.toMessage()}`);
  }
};
var InvalidIntervalError = class extends LuxonError {
  constructor(reason) {
    super(`Invalid Interval: ${reason.toMessage()}`);
  }
};
var InvalidDurationError = class extends LuxonError {
  constructor(reason) {
    super(`Invalid Duration: ${reason.toMessage()}`);
  }
};
var ConflictingSpecificationError = class extends LuxonError {
};
var InvalidUnitError = class extends LuxonError {
  constructor(unit) {
    super(`Invalid unit ${unit}`);
  }
};
var InvalidArgumentError = class extends LuxonError {
};
var ZoneIsAbstractError = class extends LuxonError {
  constructor() {
    super("Zone is an abstract class");
  }
};

// node_modules/luxon/src/impl/formats.js
var n = "numeric";
var s = "short";
var l = "long";
var DATE_SHORT = {
  year: n,
  month: n,
  day: n
};
var DATE_MED = {
  year: n,
  month: s,
  day: n
};
var DATE_MED_WITH_WEEKDAY = {
  year: n,
  month: s,
  day: n,
  weekday: s
};
var DATE_FULL = {
  year: n,
  month: l,
  day: n
};
var DATE_HUGE = {
  year: n,
  month: l,
  day: n,
  weekday: l
};
var TIME_SIMPLE = {
  hour: n,
  minute: n
};
var TIME_WITH_SECONDS = {
  hour: n,
  minute: n,
  second: n
};
var TIME_WITH_SHORT_OFFSET = {
  hour: n,
  minute: n,
  second: n,
  timeZoneName: s
};
var TIME_WITH_LONG_OFFSET = {
  hour: n,
  minute: n,
  second: n,
  timeZoneName: l
};
var TIME_24_SIMPLE = {
  hour: n,
  minute: n,
  hourCycle: "h23"
};
var TIME_24_WITH_SECONDS = {
  hour: n,
  minute: n,
  second: n,
  hourCycle: "h23"
};
var TIME_24_WITH_SHORT_OFFSET = {
  hour: n,
  minute: n,
  second: n,
  hourCycle: "h23",
  timeZoneName: s
};
var TIME_24_WITH_LONG_OFFSET = {
  hour: n,
  minute: n,
  second: n,
  hourCycle: "h23",
  timeZoneName: l
};
var DATETIME_SHORT = {
  year: n,
  month: n,
  day: n,
  hour: n,
  minute: n
};
var DATETIME_SHORT_WITH_SECONDS = {
  year: n,
  month: n,
  day: n,
  hour: n,
  minute: n,
  second: n
};
var DATETIME_MED = {
  year: n,
  month: s,
  day: n,
  hour: n,
  minute: n
};
var DATETIME_MED_WITH_SECONDS = {
  year: n,
  month: s,
  day: n,
  hour: n,
  minute: n,
  second: n
};
var DATETIME_MED_WITH_WEEKDAY = {
  year: n,
  month: s,
  day: n,
  weekday: s,
  hour: n,
  minute: n
};
var DATETIME_FULL = {
  year: n,
  month: l,
  day: n,
  hour: n,
  minute: n,
  timeZoneName: s
};
var DATETIME_FULL_WITH_SECONDS = {
  year: n,
  month: l,
  day: n,
  hour: n,
  minute: n,
  second: n,
  timeZoneName: s
};
var DATETIME_HUGE = {
  year: n,
  month: l,
  day: n,
  weekday: l,
  hour: n,
  minute: n,
  timeZoneName: l
};
var DATETIME_HUGE_WITH_SECONDS = {
  year: n,
  month: l,
  day: n,
  weekday: l,
  hour: n,
  minute: n,
  second: n,
  timeZoneName: l
};

// node_modules/luxon/src/zone.js
var Zone = class {
  /**
   * The type of zone
   * @abstract
   * @type {string}
   */
  get type() {
    throw new ZoneIsAbstractError();
  }
  /**
   * The name of this zone.
   * @abstract
   * @type {string}
   */
  get name() {
    throw new ZoneIsAbstractError();
  }
  get ianaName() {
    return this.name;
  }
  /**
   * Returns whether the offset is known to be fixed for the whole year.
   * @abstract
   * @type {boolean}
   */
  get isUniversal() {
    throw new ZoneIsAbstractError();
  }
  /**
   * Returns the offset's common name (such as EST) at the specified timestamp
   * @abstract
   * @param {number} ts - Epoch milliseconds for which to get the name
   * @param {Object} opts - Options to affect the format
   * @param {string} opts.format - What style of offset to return. Accepts 'long' or 'short'.
   * @param {string} opts.locale - What locale to return the offset name in.
   * @return {string}
   */
  offsetName(ts, opts) {
    throw new ZoneIsAbstractError();
  }
  /**
   * Returns the offset's value as a string
   * @abstract
   * @param {number} ts - Epoch milliseconds for which to get the offset
   * @param {string} format - What style of offset to return.
   *                          Accepts 'narrow', 'short', or 'techie'. Returning '+6', '+06:00', or '+0600' respectively
   * @return {string}
   */
  formatOffset(ts, format) {
    throw new ZoneIsAbstractError();
  }
  /**
   * Return the offset in minutes for this zone at the specified timestamp.
   * @abstract
   * @param {number} ts - Epoch milliseconds for which to compute the offset
   * @return {number}
   */
  offset(ts) {
    throw new ZoneIsAbstractError();
  }
  /**
   * Return whether this Zone is equal to another zone
   * @abstract
   * @param {Zone} otherZone - the zone to compare
   * @return {boolean}
   */
  equals(otherZone) {
    throw new ZoneIsAbstractError();
  }
  /**
   * Return whether this Zone is valid.
   * @abstract
   * @type {boolean}
   */
  get isValid() {
    throw new ZoneIsAbstractError();
  }
};

// node_modules/luxon/src/zones/systemZone.js
var singleton = null;
var SystemZone = class _SystemZone extends Zone {
  /**
   * Get a singleton instance of the local zone
   * @return {SystemZone}
   */
  static get instance() {
    if (singleton === null) {
      singleton = new _SystemZone();
    }
    return singleton;
  }
  /** @override **/
  get type() {
    return "system";
  }
  /** @override **/
  get name() {
    return new Intl.DateTimeFormat().resolvedOptions().timeZone;
  }
  /** @override **/
  get isUniversal() {
    return false;
  }
  /** @override **/
  offsetName(ts, { format, locale }) {
    return parseZoneInfo(ts, format, locale);
  }
  /** @override **/
  formatOffset(ts, format) {
    return formatOffset(this.offset(ts), format);
  }
  /** @override **/
  offset(ts) {
    return -new Date(ts).getTimezoneOffset();
  }
  /** @override **/
  equals(otherZone) {
    return otherZone.type === "system";
  }
  /** @override **/
  get isValid() {
    return true;
  }
};

// node_modules/luxon/src/zones/IANAZone.js
var dtfCache = {};
function makeDTF(zone) {
  if (!dtfCache[zone]) {
    dtfCache[zone] = new Intl.DateTimeFormat("en-US", {
      hour12: false,
      timeZone: zone,
      year: "numeric",
      month: "2-digit",
      day: "2-digit",
      hour: "2-digit",
      minute: "2-digit",
      second: "2-digit",
      era: "short"
    });
  }
  return dtfCache[zone];
}
var typeToPos = {
  year: 0,
  month: 1,
  day: 2,
  era: 3,
  hour: 4,
  minute: 5,
  second: 6
};
function hackyOffset(dtf, date) {
  const formatted = dtf.format(date).replace(/\u200E/g, ""), parsed = /(\d+)\/(\d+)\/(\d+) (AD|BC),? (\d+):(\d+):(\d+)/.exec(formatted), [, fMonth, fDay, fYear, fadOrBc, fHour, fMinute, fSecond] = parsed;
  return [fYear, fMonth, fDay, fadOrBc, fHour, fMinute, fSecond];
}
function partsOffset(dtf, date) {
  const formatted = dtf.formatToParts(date);
  const filled = [];
  for (let i = 0; i < formatted.length; i++) {
    const { type, value } = formatted[i];
    const pos = typeToPos[type];
    if (type === "era") {
      filled[pos] = value;
    } else if (!isUndefined(pos)) {
      filled[pos] = parseInt(value, 10);
    }
  }
  return filled;
}
var ianaZoneCache = {};
var IANAZone = class _IANAZone extends Zone {
  /**
   * @param {string} name - Zone name
   * @return {IANAZone}
   */
  static create(name) {
    if (!ianaZoneCache[name]) {
      ianaZoneCache[name] = new _IANAZone(name);
    }
    return ianaZoneCache[name];
  }
  /**
   * Reset local caches. Should only be necessary in testing scenarios.
   * @return {void}
   */
  static resetCache() {
    ianaZoneCache = {};
    dtfCache = {};
  }
  /**
   * Returns whether the provided string is a valid specifier. This only checks the string's format, not that the specifier identifies a known zone; see isValidZone for that.
   * @param {string} s - The string to check validity on
   * @example IANAZone.isValidSpecifier("America/New_York") //=> true
   * @example IANAZone.isValidSpecifier("Sport~~blorp") //=> false
   * @deprecated This method returns false for some valid IANA names. Use isValidZone instead.
   * @return {boolean}
   */
  static isValidSpecifier(s2) {
    return this.isValidZone(s2);
  }
  /**
   * Returns whether the provided string identifies a real zone
   * @param {string} zone - The string to check
   * @example IANAZone.isValidZone("America/New_York") //=> true
   * @example IANAZone.isValidZone("Fantasia/Castle") //=> false
   * @example IANAZone.isValidZone("Sport~~blorp") //=> false
   * @return {boolean}
   */
  static isValidZone(zone) {
    if (!zone) {
      return false;
    }
    try {
      new Intl.DateTimeFormat("en-US", { timeZone: zone }).format();
      return true;
    } catch (e) {
      return false;
    }
  }
  constructor(name) {
    super();
    this.zoneName = name;
    this.valid = _IANAZone.isValidZone(name);
  }
  /** @override **/
  get type() {
    return "iana";
  }
  /** @override **/
  get name() {
    return this.zoneName;
  }
  /** @override **/
  get isUniversal() {
    return false;
  }
  /** @override **/
  offsetName(ts, { format, locale }) {
    return parseZoneInfo(ts, format, locale, this.name);
  }
  /** @override **/
  formatOffset(ts, format) {
    return formatOffset(this.offset(ts), format);
  }
  /** @override **/
  offset(ts) {
    const date = new Date(ts);
    if (isNaN(date))
      return NaN;
    const dtf = makeDTF(this.name);
    let [year, month, day, adOrBc, hour, minute, second] = dtf.formatToParts ? partsOffset(dtf, date) : hackyOffset(dtf, date);
    if (adOrBc === "BC") {
      year = -Math.abs(year) + 1;
    }
    const adjustedHour = hour === 24 ? 0 : hour;
    const asUTC = objToLocalTS({
      year,
      month,
      day,
      hour: adjustedHour,
      minute,
      second,
      millisecond: 0
    });
    let asTS = +date;
    const over = asTS % 1e3;
    asTS -= over >= 0 ? over : 1e3 + over;
    return (asUTC - asTS) / (60 * 1e3);
  }
  /** @override **/
  equals(otherZone) {
    return otherZone.type === "iana" && otherZone.name === this.name;
  }
  /** @override **/
  get isValid() {
    return this.valid;
  }
};

// node_modules/luxon/src/impl/locale.js
var intlLFCache = {};
function getCachedLF(locString, opts = {}) {
  const key = JSON.stringify([locString, opts]);
  let dtf = intlLFCache[key];
  if (!dtf) {
    dtf = new Intl.ListFormat(locString, opts);
    intlLFCache[key] = dtf;
  }
  return dtf;
}
var intlDTCache = {};
function getCachedDTF(locString, opts = {}) {
  const key = JSON.stringify([locString, opts]);
  let dtf = intlDTCache[key];
  if (!dtf) {
    dtf = new Intl.DateTimeFormat(locString, opts);
    intlDTCache[key] = dtf;
  }
  return dtf;
}
var intlNumCache = {};
function getCachedINF(locString, opts = {}) {
  const key = JSON.stringify([locString, opts]);
  let inf = intlNumCache[key];
  if (!inf) {
    inf = new Intl.NumberFormat(locString, opts);
    intlNumCache[key] = inf;
  }
  return inf;
}
var intlRelCache = {};
function getCachedRTF(locString, opts = {}) {
  const { base, ...cacheKeyOpts } = opts;
  const key = JSON.stringify([locString, cacheKeyOpts]);
  let inf = intlRelCache[key];
  if (!inf) {
    inf = new Intl.RelativeTimeFormat(locString, opts);
    intlRelCache[key] = inf;
  }
  return inf;
}
var sysLocaleCache = null;
function systemLocale() {
  if (sysLocaleCache) {
    return sysLocaleCache;
  } else {
    sysLocaleCache = new Intl.DateTimeFormat().resolvedOptions().locale;
    return sysLocaleCache;
  }
}
var weekInfoCache = {};
function getCachedWeekInfo(locString) {
  let data = weekInfoCache[locString];
  if (!data) {
    const locale = new Intl.Locale(locString);
    data = "getWeekInfo" in locale ? locale.getWeekInfo() : locale.weekInfo;
    weekInfoCache[locString] = data;
  }
  return data;
}
function parseLocaleString(localeStr) {
  const xIndex = localeStr.indexOf("-x-");
  if (xIndex !== -1) {
    localeStr = localeStr.substring(0, xIndex);
  }
  const uIndex = localeStr.indexOf("-u-");
  if (uIndex === -1) {
    return [localeStr];
  } else {
    let options;
    let selectedStr;
    try {
      options = getCachedDTF(localeStr).resolvedOptions();
      selectedStr = localeStr;
    } catch (e) {
      const smaller = localeStr.substring(0, uIndex);
      options = getCachedDTF(smaller).resolvedOptions();
      selectedStr = smaller;
    }
    const { numberingSystem, calendar } = options;
    return [selectedStr, numberingSystem, calendar];
  }
}
function intlConfigString(localeStr, numberingSystem, outputCalendar) {
  if (outputCalendar || numberingSystem) {
    if (!localeStr.includes("-u-")) {
      localeStr += "-u";
    }
    if (outputCalendar) {
      localeStr += `-ca-${outputCalendar}`;
    }
    if (numberingSystem) {
      localeStr += `-nu-${numberingSystem}`;
    }
    return localeStr;
  } else {
    return localeStr;
  }
}
function mapMonths(f) {
  const ms = [];
  for (let i = 1; i <= 12; i++) {
    const dt = DateTime.utc(2009, i, 1);
    ms.push(f(dt));
  }
  return ms;
}
function mapWeekdays(f) {
  const ms = [];
  for (let i = 1; i <= 7; i++) {
    const dt = DateTime.utc(2016, 11, 13 + i);
    ms.push(f(dt));
  }
  return ms;
}
function listStuff(loc, length, englishFn, intlFn) {
  const mode = loc.listingMode();
  if (mode === "error") {
    return null;
  } else if (mode === "en") {
    return englishFn(length);
  } else {
    return intlFn(length);
  }
}
function supportsFastNumbers(loc) {
  if (loc.numberingSystem && loc.numberingSystem !== "latn") {
    return false;
  } else {
    return loc.numberingSystem === "latn" || !loc.locale || loc.locale.startsWith("en") || new Intl.DateTimeFormat(loc.intl).resolvedOptions().numberingSystem === "latn";
  }
}
var PolyNumberFormatter = class {
  constructor(intl, forceSimple, opts) {
    this.padTo = opts.padTo || 0;
    this.floor = opts.floor || false;
    const { padTo, floor, ...otherOpts } = opts;
    if (!forceSimple || Object.keys(otherOpts).length > 0) {
      const intlOpts = { useGrouping: false, ...opts };
      if (opts.padTo > 0)
        intlOpts.minimumIntegerDigits = opts.padTo;
      this.inf = getCachedINF(intl, intlOpts);
    }
  }
  format(i) {
    if (this.inf) {
      const fixed = this.floor ? Math.floor(i) : i;
      return this.inf.format(fixed);
    } else {
      const fixed = this.floor ? Math.floor(i) : roundTo(i, 3);
      return padStart(fixed, this.padTo);
    }
  }
};
var PolyDateFormatter = class {
  constructor(dt, intl, opts) {
    this.opts = opts;
    this.originalZone = void 0;
    let z = void 0;
    if (this.opts.timeZone) {
      this.dt = dt;
    } else if (dt.zone.type === "fixed") {
      const gmtOffset = -1 * (dt.offset / 60);
      const offsetZ = gmtOffset >= 0 ? `Etc/GMT+${gmtOffset}` : `Etc/GMT${gmtOffset}`;
      if (dt.offset !== 0 && IANAZone.create(offsetZ).valid) {
        z = offsetZ;
        this.dt = dt;
      } else {
        z = "UTC";
        this.dt = dt.offset === 0 ? dt : dt.setZone("UTC").plus({ minutes: dt.offset });
        this.originalZone = dt.zone;
      }
    } else if (dt.zone.type === "system") {
      this.dt = dt;
    } else if (dt.zone.type === "iana") {
      this.dt = dt;
      z = dt.zone.name;
    } else {
      z = "UTC";
      this.dt = dt.setZone("UTC").plus({ minutes: dt.offset });
      this.originalZone = dt.zone;
    }
    const intlOpts = { ...this.opts };
    intlOpts.timeZone = intlOpts.timeZone || z;
    this.dtf = getCachedDTF(intl, intlOpts);
  }
  format() {
    if (this.originalZone) {
      return this.formatToParts().map(({ value }) => value).join("");
    }
    return this.dtf.format(this.dt.toJSDate());
  }
  formatToParts() {
    const parts = this.dtf.formatToParts(this.dt.toJSDate());
    if (this.originalZone) {
      return parts.map((part) => {
        if (part.type === "timeZoneName") {
          const offsetName = this.originalZone.offsetName(this.dt.ts, {
            locale: this.dt.locale,
            format: this.opts.timeZoneName
          });
          return {
            ...part,
            value: offsetName
          };
        } else {
          return part;
        }
      });
    }
    return parts;
  }
  resolvedOptions() {
    return this.dtf.resolvedOptions();
  }
};
var PolyRelFormatter = class {
  constructor(intl, isEnglish, opts) {
    this.opts = { style: "long", ...opts };
    if (!isEnglish && hasRelative()) {
      this.rtf = getCachedRTF(intl, opts);
    }
  }
  format(count, unit) {
    if (this.rtf) {
      return this.rtf.format(count, unit);
    } else {
      return formatRelativeTime(unit, count, this.opts.numeric, this.opts.style !== "long");
    }
  }
  formatToParts(count, unit) {
    if (this.rtf) {
      return this.rtf.formatToParts(count, unit);
    } else {
      return [];
    }
  }
};
var fallbackWeekSettings = {
  firstDay: 1,
  minimalDays: 4,
  weekend: [6, 7]
};
var Locale = class _Locale {
  static fromOpts(opts) {
    return _Locale.create(
      opts.locale,
      opts.numberingSystem,
      opts.outputCalendar,
      opts.weekSettings,
      opts.defaultToEN
    );
  }
  static create(locale, numberingSystem, outputCalendar, weekSettings, defaultToEN = false) {
    const specifiedLocale = locale || Settings.defaultLocale;
    const localeR = specifiedLocale || (defaultToEN ? "en-US" : systemLocale());
    const numberingSystemR = numberingSystem || Settings.defaultNumberingSystem;
    const outputCalendarR = outputCalendar || Settings.defaultOutputCalendar;
    const weekSettingsR = validateWeekSettings(weekSettings) || Settings.defaultWeekSettings;
    return new _Locale(localeR, numberingSystemR, outputCalendarR, weekSettingsR, specifiedLocale);
  }
  static resetCache() {
    sysLocaleCache = null;
    intlDTCache = {};
    intlNumCache = {};
    intlRelCache = {};
  }
  static fromObject({ locale, numberingSystem, outputCalendar, weekSettings } = {}) {
    return _Locale.create(locale, numberingSystem, outputCalendar, weekSettings);
  }
  constructor(locale, numbering, outputCalendar, weekSettings, specifiedLocale) {
    const [parsedLocale, parsedNumberingSystem, parsedOutputCalendar] = parseLocaleString(locale);
    this.locale = parsedLocale;
    this.numberingSystem = numbering || parsedNumberingSystem || null;
    this.outputCalendar = outputCalendar || parsedOutputCalendar || null;
    this.weekSettings = weekSettings;
    this.intl = intlConfigString(this.locale, this.numberingSystem, this.outputCalendar);
    this.weekdaysCache = { format: {}, standalone: {} };
    this.monthsCache = { format: {}, standalone: {} };
    this.meridiemCache = null;
    this.eraCache = {};
    this.specifiedLocale = specifiedLocale;
    this.fastNumbersCached = null;
  }
  get fastNumbers() {
    if (this.fastNumbersCached == null) {
      this.fastNumbersCached = supportsFastNumbers(this);
    }
    return this.fastNumbersCached;
  }
  listingMode() {
    const isActuallyEn = this.isEnglish();
    const hasNoWeirdness = (this.numberingSystem === null || this.numberingSystem === "latn") && (this.outputCalendar === null || this.outputCalendar === "gregory");
    return isActuallyEn && hasNoWeirdness ? "en" : "intl";
  }
  clone(alts) {
    if (!alts || Object.getOwnPropertyNames(alts).length === 0) {
      return this;
    } else {
      return _Locale.create(
        alts.locale || this.specifiedLocale,
        alts.numberingSystem || this.numberingSystem,
        alts.outputCalendar || this.outputCalendar,
        validateWeekSettings(alts.weekSettings) || this.weekSettings,
        alts.defaultToEN || false
      );
    }
  }
  redefaultToEN(alts = {}) {
    return this.clone({ ...alts, defaultToEN: true });
  }
  redefaultToSystem(alts = {}) {
    return this.clone({ ...alts, defaultToEN: false });
  }
  months(length, format = false) {
    return listStuff(this, length, months, () => {
      const intl = format ? { month: length, day: "numeric" } : { month: length }, formatStr = format ? "format" : "standalone";
      if (!this.monthsCache[formatStr][length]) {
        this.monthsCache[formatStr][length] = mapMonths((dt) => this.extract(dt, intl, "month"));
      }
      return this.monthsCache[formatStr][length];
    });
  }
  weekdays(length, format = false) {
    return listStuff(this, length, weekdays, () => {
      const intl = format ? { weekday: length, year: "numeric", month: "long", day: "numeric" } : { weekday: length }, formatStr = format ? "format" : "standalone";
      if (!this.weekdaysCache[formatStr][length]) {
        this.weekdaysCache[formatStr][length] = mapWeekdays(
          (dt) => this.extract(dt, intl, "weekday")
        );
      }
      return this.weekdaysCache[formatStr][length];
    });
  }
  meridiems() {
    return listStuff(
      this,
      void 0,
      () => meridiems,
      () => {
        if (!this.meridiemCache) {
          const intl = { hour: "numeric", hourCycle: "h12" };
          this.meridiemCache = [DateTime.utc(2016, 11, 13, 9), DateTime.utc(2016, 11, 13, 19)].map(
            (dt) => this.extract(dt, intl, "dayperiod")
          );
        }
        return this.meridiemCache;
      }
    );
  }
  eras(length) {
    return listStuff(this, length, eras, () => {
      const intl = { era: length };
      if (!this.eraCache[length]) {
        this.eraCache[length] = [DateTime.utc(-40, 1, 1), DateTime.utc(2017, 1, 1)].map(
          (dt) => this.extract(dt, intl, "era")
        );
      }
      return this.eraCache[length];
    });
  }
  extract(dt, intlOpts, field) {
    const df = this.dtFormatter(dt, intlOpts), results = df.formatToParts(), matching = results.find((m) => m.type.toLowerCase() === field);
    return matching ? matching.value : null;
  }
  numberFormatter(opts = {}) {
    return new PolyNumberFormatter(this.intl, opts.forceSimple || this.fastNumbers, opts);
  }
  dtFormatter(dt, intlOpts = {}) {
    return new PolyDateFormatter(dt, this.intl, intlOpts);
  }
  relFormatter(opts = {}) {
    return new PolyRelFormatter(this.intl, this.isEnglish(), opts);
  }
  listFormatter(opts = {}) {
    return getCachedLF(this.intl, opts);
  }
  isEnglish() {
    return this.locale === "en" || this.locale.toLowerCase() === "en-us" || new Intl.DateTimeFormat(this.intl).resolvedOptions().locale.startsWith("en-us");
  }
  getWeekSettings() {
    if (this.weekSettings) {
      return this.weekSettings;
    } else if (!hasLocaleWeekInfo()) {
      return fallbackWeekSettings;
    } else {
      return getCachedWeekInfo(this.locale);
    }
  }
  getStartOfWeek() {
    return this.getWeekSettings().firstDay;
  }
  getMinDaysInFirstWeek() {
    return this.getWeekSettings().minimalDays;
  }
  getWeekendDays() {
    return this.getWeekSettings().weekend;
  }
  equals(other) {
    return this.locale === other.locale && this.numberingSystem === other.numberingSystem && this.outputCalendar === other.outputCalendar;
  }
};

// node_modules/luxon/src/zones/fixedOffsetZone.js
var singleton2 = null;
var FixedOffsetZone = class _FixedOffsetZone extends Zone {
  /**
   * Get a singleton instance of UTC
   * @return {FixedOffsetZone}
   */
  static get utcInstance() {
    if (singleton2 === null) {
      singleton2 = new _FixedOffsetZone(0);
    }
    return singleton2;
  }
  /**
   * Get an instance with a specified offset
   * @param {number} offset - The offset in minutes
   * @return {FixedOffsetZone}
   */
  static instance(offset2) {
    return offset2 === 0 ? _FixedOffsetZone.utcInstance : new _FixedOffsetZone(offset2);
  }
  /**
   * Get an instance of FixedOffsetZone from a UTC offset string, like "UTC+6"
   * @param {string} s - The offset string to parse
   * @example FixedOffsetZone.parseSpecifier("UTC+6")
   * @example FixedOffsetZone.parseSpecifier("UTC+06")
   * @example FixedOffsetZone.parseSpecifier("UTC-6:00")
   * @return {FixedOffsetZone}
   */
  static parseSpecifier(s2) {
    if (s2) {
      const r = s2.match(/^utc(?:([+-]\d{1,2})(?::(\d{2}))?)?$/i);
      if (r) {
        return new _FixedOffsetZone(signedOffset(r[1], r[2]));
      }
    }
    return null;
  }
  constructor(offset2) {
    super();
    this.fixed = offset2;
  }
  /** @override **/
  get type() {
    return "fixed";
  }
  /** @override **/
  get name() {
    return this.fixed === 0 ? "UTC" : `UTC${formatOffset(this.fixed, "narrow")}`;
  }
  get ianaName() {
    if (this.fixed === 0) {
      return "Etc/UTC";
    } else {
      return `Etc/GMT${formatOffset(-this.fixed, "narrow")}`;
    }
  }
  /** @override **/
  offsetName() {
    return this.name;
  }
  /** @override **/
  formatOffset(ts, format) {
    return formatOffset(this.fixed, format);
  }
  /** @override **/
  get isUniversal() {
    return true;
  }
  /** @override **/
  offset() {
    return this.fixed;
  }
  /** @override **/
  equals(otherZone) {
    return otherZone.type === "fixed" && otherZone.fixed === this.fixed;
  }
  /** @override **/
  get isValid() {
    return true;
  }
};

// node_modules/luxon/src/zones/invalidZone.js
var InvalidZone = class extends Zone {
  constructor(zoneName) {
    super();
    this.zoneName = zoneName;
  }
  /** @override **/
  get type() {
    return "invalid";
  }
  /** @override **/
  get name() {
    return this.zoneName;
  }
  /** @override **/
  get isUniversal() {
    return false;
  }
  /** @override **/
  offsetName() {
    return null;
  }
  /** @override **/
  formatOffset() {
    return "";
  }
  /** @override **/
  offset() {
    return NaN;
  }
  /** @override **/
  equals() {
    return false;
  }
  /** @override **/
  get isValid() {
    return false;
  }
};

// node_modules/luxon/src/impl/zoneUtil.js
function normalizeZone(input, defaultZone2) {
  let offset2;
  if (isUndefined(input) || input === null) {
    return defaultZone2;
  } else if (input instanceof Zone) {
    return input;
  } else if (isString(input)) {
    const lowered = input.toLowerCase();
    if (lowered === "default")
      return defaultZone2;
    else if (lowered === "local" || lowered === "system")
      return SystemZone.instance;
    else if (lowered === "utc" || lowered === "gmt")
      return FixedOffsetZone.utcInstance;
    else
      return FixedOffsetZone.parseSpecifier(lowered) || IANAZone.create(input);
  } else if (isNumber(input)) {
    return FixedOffsetZone.instance(input);
  } else if (typeof input === "object" && "offset" in input && typeof input.offset === "function") {
    return input;
  } else {
    return new InvalidZone(input);
  }
}

// node_modules/luxon/src/settings.js
var now = () => Date.now();
var defaultZone = "system";
var defaultLocale = null;
var defaultNumberingSystem = null;
var defaultOutputCalendar = null;
var twoDigitCutoffYear = 60;
var throwOnInvalid;
var defaultWeekSettings = null;
var Settings = class {
  /**
   * Get the callback for returning the current timestamp.
   * @type {function}
   */
  static get now() {
    return now;
  }
  /**
   * Set the callback for returning the current timestamp.
   * The function should return a number, which will be interpreted as an Epoch millisecond count
   * @type {function}
   * @example Settings.now = () => Date.now() + 3000 // pretend it is 3 seconds in the future
   * @example Settings.now = () => 0 // always pretend it's Jan 1, 1970 at midnight in UTC time
   */
  static set now(n2) {
    now = n2;
  }
  /**
   * Set the default time zone to create DateTimes in. Does not affect existing instances.
   * Use the value "system" to reset this value to the system's time zone.
   * @type {string}
   */
  static set defaultZone(zone) {
    defaultZone = zone;
  }
  /**
   * Get the default time zone object currently used to create DateTimes. Does not affect existing instances.
   * The default value is the system's time zone (the one set on the machine that runs this code).
   * @type {Zone}
   */
  static get defaultZone() {
    return normalizeZone(defaultZone, SystemZone.instance);
  }
  /**
   * Get the default locale to create DateTimes with. Does not affect existing instances.
   * @type {string}
   */
  static get defaultLocale() {
    return defaultLocale;
  }
  /**
   * Set the default locale to create DateTimes with. Does not affect existing instances.
   * @type {string}
   */
  static set defaultLocale(locale) {
    defaultLocale = locale;
  }
  /**
   * Get the default numbering system to create DateTimes with. Does not affect existing instances.
   * @type {string}
   */
  static get defaultNumberingSystem() {
    return defaultNumberingSystem;
  }
  /**
   * Set the default numbering system to create DateTimes with. Does not affect existing instances.
   * @type {string}
   */
  static set defaultNumberingSystem(numberingSystem) {
    defaultNumberingSystem = numberingSystem;
  }
  /**
   * Get the default output calendar to create DateTimes with. Does not affect existing instances.
   * @type {string}
   */
  static get defaultOutputCalendar() {
    return defaultOutputCalendar;
  }
  /**
   * Set the default output calendar to create DateTimes with. Does not affect existing instances.
   * @type {string}
   */
  static set defaultOutputCalendar(outputCalendar) {
    defaultOutputCalendar = outputCalendar;
  }
  /**
   * @typedef {Object} WeekSettings
   * @property {number} firstDay
   * @property {number} minimalDays
   * @property {number[]} weekend
   */
  /**
   * @return {WeekSettings|null}
   */
  static get defaultWeekSettings() {
    return defaultWeekSettings;
  }
  /**
   * Allows overriding the default locale week settings, i.e. the start of the week, the weekend and
   * how many days are required in the first week of a year.
   * Does not affect existing instances.
   *
   * @param {WeekSettings|null} weekSettings
   */
  static set defaultWeekSettings(weekSettings) {
    defaultWeekSettings = validateWeekSettings(weekSettings);
  }
  /**
   * Get the cutoff year after which a string encoding a year as two digits is interpreted to occur in the current century.
   * @type {number}
   */
  static get twoDigitCutoffYear() {
    return twoDigitCutoffYear;
  }
  /**
   * Set the cutoff year after which a string encoding a year as two digits is interpreted to occur in the current century.
   * @type {number}
   * @example Settings.twoDigitCutoffYear = 0 // cut-off year is 0, so all 'yy' are interpreted as current century
   * @example Settings.twoDigitCutoffYear = 50 // '49' -> 1949; '50' -> 2050
   * @example Settings.twoDigitCutoffYear = 1950 // interpreted as 50
   * @example Settings.twoDigitCutoffYear = 2050 // ALSO interpreted as 50
   */
  static set twoDigitCutoffYear(cutoffYear) {
    twoDigitCutoffYear = cutoffYear % 100;
  }
  /**
   * Get whether Luxon will throw when it encounters invalid DateTimes, Durations, or Intervals
   * @type {boolean}
   */
  static get throwOnInvalid() {
    return throwOnInvalid;
  }
  /**
   * Set whether Luxon will throw when it encounters invalid DateTimes, Durations, or Intervals
   * @type {boolean}
   */
  static set throwOnInvalid(t) {
    throwOnInvalid = t;
  }
  /**
   * Reset Luxon's global caches. Should only be necessary in testing scenarios.
   * @return {void}
   */
  static resetCaches() {
    Locale.resetCache();
    IANAZone.resetCache();
  }
};

// node_modules/luxon/src/impl/invalid.js
var Invalid = class {
  constructor(reason, explanation) {
    this.reason = reason;
    this.explanation = explanation;
  }
  toMessage() {
    if (this.explanation) {
      return `${this.reason}: ${this.explanation}`;
    } else {
      return this.reason;
    }
  }
};

// node_modules/luxon/src/impl/conversions.js
var nonLeapLadder = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334];
var leapLadder = [0, 31, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335];
function unitOutOfRange(unit, value) {
  return new Invalid(
    "unit out of range",
    `you specified ${value} (of type ${typeof value}) as a ${unit}, which is invalid`
  );
}
function dayOfWeek(year, month, day) {
  const d = new Date(Date.UTC(year, month - 1, day));
  if (year < 100 && year >= 0) {
    d.setUTCFullYear(d.getUTCFullYear() - 1900);
  }
  const js = d.getUTCDay();
  return js === 0 ? 7 : js;
}
function computeOrdinal(year, month, day) {
  return day + (isLeapYear(year) ? leapLadder : nonLeapLadder)[month - 1];
}
function uncomputeOrdinal(year, ordinal) {
  const table = isLeapYear(year) ? leapLadder : nonLeapLadder, month0 = table.findIndex((i) => i < ordinal), day = ordinal - table[month0];
  return { month: month0 + 1, day };
}
function isoWeekdayToLocal(isoWeekday, startOfWeek) {
  return (isoWeekday - startOfWeek + 7) % 7 + 1;
}
function gregorianToWeek(gregObj, minDaysInFirstWeek = 4, startOfWeek = 1) {
  const { year, month, day } = gregObj, ordinal = computeOrdinal(year, month, day), weekday = isoWeekdayToLocal(dayOfWeek(year, month, day), startOfWeek);
  let weekNumber = Math.floor((ordinal - weekday + 14 - minDaysInFirstWeek) / 7), weekYear;
  if (weekNumber < 1) {
    weekYear = year - 1;
    weekNumber = weeksInWeekYear(weekYear, minDaysInFirstWeek, startOfWeek);
  } else if (weekNumber > weeksInWeekYear(year, minDaysInFirstWeek, startOfWeek)) {
    weekYear = year + 1;
    weekNumber = 1;
  } else {
    weekYear = year;
  }
  return { weekYear, weekNumber, weekday, ...timeObject(gregObj) };
}
function weekToGregorian(weekData, minDaysInFirstWeek = 4, startOfWeek = 1) {
  const { weekYear, weekNumber, weekday } = weekData, weekdayOfJan4 = isoWeekdayToLocal(dayOfWeek(weekYear, 1, minDaysInFirstWeek), startOfWeek), yearInDays = daysInYear(weekYear);
  let ordinal = weekNumber * 7 + weekday - weekdayOfJan4 - 7 + minDaysInFirstWeek, year;
  if (ordinal < 1) {
    year = weekYear - 1;
    ordinal += daysInYear(year);
  } else if (ordinal > yearInDays) {
    year = weekYear + 1;
    ordinal -= daysInYear(weekYear);
  } else {
    year = weekYear;
  }
  const { month, day } = uncomputeOrdinal(year, ordinal);
  return { year, month, day, ...timeObject(weekData) };
}
function gregorianToOrdinal(gregData) {
  const { year, month, day } = gregData;
  const ordinal = computeOrdinal(year, month, day);
  return { year, ordinal, ...timeObject(gregData) };
}
function ordinalToGregorian(ordinalData) {
  const { year, ordinal } = ordinalData;
  const { month, day } = uncomputeOrdinal(year, ordinal);
  return { year, month, day, ...timeObject(ordinalData) };
}
function usesLocalWeekValues(obj, loc) {
  const hasLocaleWeekData = !isUndefined(obj.localWeekday) || !isUndefined(obj.localWeekNumber) || !isUndefined(obj.localWeekYear);
  if (hasLocaleWeekData) {
    const hasIsoWeekData = !isUndefined(obj.weekday) || !isUndefined(obj.weekNumber) || !isUndefined(obj.weekYear);
    if (hasIsoWeekData) {
      throw new ConflictingSpecificationError(
        "Cannot mix locale-based week fields with ISO-based week fields"
      );
    }
    if (!isUndefined(obj.localWeekday))
      obj.weekday = obj.localWeekday;
    if (!isUndefined(obj.localWeekNumber))
      obj.weekNumber = obj.localWeekNumber;
    if (!isUndefined(obj.localWeekYear))
      obj.weekYear = obj.localWeekYear;
    delete obj.localWeekday;
    delete obj.localWeekNumber;
    delete obj.localWeekYear;
    return {
      minDaysInFirstWeek: loc.getMinDaysInFirstWeek(),
      startOfWeek: loc.getStartOfWeek()
    };
  } else {
    return { minDaysInFirstWeek: 4, startOfWeek: 1 };
  }
}
function hasInvalidWeekData(obj, minDaysInFirstWeek = 4, startOfWeek = 1) {
  const validYear = isInteger(obj.weekYear), validWeek = integerBetween(
    obj.weekNumber,
    1,
    weeksInWeekYear(obj.weekYear, minDaysInFirstWeek, startOfWeek)
  ), validWeekday = integerBetween(obj.weekday, 1, 7);
  if (!validYear) {
    return unitOutOfRange("weekYear", obj.weekYear);
  } else if (!validWeek) {
    return unitOutOfRange("week", obj.weekNumber);
  } else if (!validWeekday) {
    return unitOutOfRange("weekday", obj.weekday);
  } else
    return false;
}
function hasInvalidOrdinalData(obj) {
  const validYear = isInteger(obj.year), validOrdinal = integerBetween(obj.ordinal, 1, daysInYear(obj.year));
  if (!validYear) {
    return unitOutOfRange("year", obj.year);
  } else if (!validOrdinal) {
    return unitOutOfRange("ordinal", obj.ordinal);
  } else
    return false;
}
function hasInvalidGregorianData(obj) {
  const validYear = isInteger(obj.year), validMonth = integerBetween(obj.month, 1, 12), validDay = integerBetween(obj.day, 1, daysInMonth(obj.year, obj.month));
  if (!validYear) {
    return unitOutOfRange("year", obj.year);
  } else if (!validMonth) {
    return unitOutOfRange("month", obj.month);
  } else if (!validDay) {
    return unitOutOfRange("day", obj.day);
  } else
    return false;
}
function hasInvalidTimeData(obj) {
  const { hour, minute, second, millisecond } = obj;
  const validHour = integerBetween(hour, 0, 23) || hour === 24 && minute === 0 && second === 0 && millisecond === 0, validMinute = integerBetween(minute, 0, 59), validSecond = integerBetween(second, 0, 59), validMillisecond = integerBetween(millisecond, 0, 999);
  if (!validHour) {
    return unitOutOfRange("hour", hour);
  } else if (!validMinute) {
    return unitOutOfRange("minute", minute);
  } else if (!validSecond) {
    return unitOutOfRange("second", second);
  } else if (!validMillisecond) {
    return unitOutOfRange("millisecond", millisecond);
  } else
    return false;
}

// node_modules/luxon/src/impl/util.js
function isUndefined(o) {
  return typeof o === "undefined";
}
function isNumber(o) {
  return typeof o === "number";
}
function isInteger(o) {
  return typeof o === "number" && o % 1 === 0;
}
function isString(o) {
  return typeof o === "string";
}
function isDate(o) {
  return Object.prototype.toString.call(o) === "[object Date]";
}
function hasRelative() {
  try {
    return typeof Intl !== "undefined" && !!Intl.RelativeTimeFormat;
  } catch (e) {
    return false;
  }
}
function hasLocaleWeekInfo() {
  try {
    return typeof Intl !== "undefined" && !!Intl.Locale && ("weekInfo" in Intl.Locale.prototype || "getWeekInfo" in Intl.Locale.prototype);
  } catch (e) {
    return false;
  }
}
function maybeArray(thing) {
  return Array.isArray(thing) ? thing : [thing];
}
function bestBy(arr, by, compare) {
  if (arr.length === 0) {
    return void 0;
  }
  return arr.reduce((best, next) => {
    const pair = [by(next), next];
    if (!best) {
      return pair;
    } else if (compare(best[0], pair[0]) === best[0]) {
      return best;
    } else {
      return pair;
    }
  }, null)[1];
}
function pick(obj, keys) {
  return keys.reduce((a, k) => {
    a[k] = obj[k];
    return a;
  }, {});
}
function hasOwnProperty(obj, prop) {
  return Object.prototype.hasOwnProperty.call(obj, prop);
}
function validateWeekSettings(settings) {
  if (settings == null) {
    return null;
  } else if (typeof settings !== "object") {
    throw new InvalidArgumentError("Week settings must be an object");
  } else {
    if (!integerBetween(settings.firstDay, 1, 7) || !integerBetween(settings.minimalDays, 1, 7) || !Array.isArray(settings.weekend) || settings.weekend.some((v) => !integerBetween(v, 1, 7))) {
      throw new InvalidArgumentError("Invalid week settings");
    }
    return {
      firstDay: settings.firstDay,
      minimalDays: settings.minimalDays,
      weekend: Array.from(settings.weekend)
    };
  }
}
function integerBetween(thing, bottom, top) {
  return isInteger(thing) && thing >= bottom && thing <= top;
}
function floorMod(x, n2) {
  return x - n2 * Math.floor(x / n2);
}
function padStart(input, n2 = 2) {
  const isNeg = input < 0;
  let padded;
  if (isNeg) {
    padded = "-" + ("" + -input).padStart(n2, "0");
  } else {
    padded = ("" + input).padStart(n2, "0");
  }
  return padded;
}
function parseInteger(string) {
  if (isUndefined(string) || string === null || string === "") {
    return void 0;
  } else {
    return parseInt(string, 10);
  }
}
function parseFloating(string) {
  if (isUndefined(string) || string === null || string === "") {
    return void 0;
  } else {
    return parseFloat(string);
  }
}
function parseMillis(fraction) {
  if (isUndefined(fraction) || fraction === null || fraction === "") {
    return void 0;
  } else {
    const f = parseFloat("0." + fraction) * 1e3;
    return Math.floor(f);
  }
}
function roundTo(number, digits, towardZero = false) {
  const factor = 10 ** digits, rounder = towardZero ? Math.trunc : Math.round;
  return rounder(number * factor) / factor;
}
function isLeapYear(year) {
  return year % 4 === 0 && (year % 100 !== 0 || year % 400 === 0);
}
function daysInYear(year) {
  return isLeapYear(year) ? 366 : 365;
}
function daysInMonth(year, month) {
  const modMonth = floorMod(month - 1, 12) + 1, modYear = year + (month - modMonth) / 12;
  if (modMonth === 2) {
    return isLeapYear(modYear) ? 29 : 28;
  } else {
    return [31, null, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][modMonth - 1];
  }
}
function objToLocalTS(obj) {
  let d = Date.UTC(
    obj.year,
    obj.month - 1,
    obj.day,
    obj.hour,
    obj.minute,
    obj.second,
    obj.millisecond
  );
  if (obj.year < 100 && obj.year >= 0) {
    d = new Date(d);
    d.setUTCFullYear(obj.year, obj.month - 1, obj.day);
  }
  return +d;
}
function firstWeekOffset(year, minDaysInFirstWeek, startOfWeek) {
  const fwdlw = isoWeekdayToLocal(dayOfWeek(year, 1, minDaysInFirstWeek), startOfWeek);
  return -fwdlw + minDaysInFirstWeek - 1;
}
function weeksInWeekYear(weekYear, minDaysInFirstWeek = 4, startOfWeek = 1) {
  const weekOffset = firstWeekOffset(weekYear, minDaysInFirstWeek, startOfWeek);
  const weekOffsetNext = firstWeekOffset(weekYear + 1, minDaysInFirstWeek, startOfWeek);
  return (daysInYear(weekYear) - weekOffset + weekOffsetNext) / 7;
}
function untruncateYear(year) {
  if (year > 99) {
    return year;
  } else
    return year > Settings.twoDigitCutoffYear ? 1900 + year : 2e3 + year;
}
function parseZoneInfo(ts, offsetFormat, locale, timeZone = null) {
  const date = new Date(ts), intlOpts = {
    hourCycle: "h23",
    year: "numeric",
    month: "2-digit",
    day: "2-digit",
    hour: "2-digit",
    minute: "2-digit"
  };
  if (timeZone) {
    intlOpts.timeZone = timeZone;
  }
  const modified = { timeZoneName: offsetFormat, ...intlOpts };
  const parsed = new Intl.DateTimeFormat(locale, modified).formatToParts(date).find((m) => m.type.toLowerCase() === "timezonename");
  return parsed ? parsed.value : null;
}
function signedOffset(offHourStr, offMinuteStr) {
  let offHour = parseInt(offHourStr, 10);
  if (Number.isNaN(offHour)) {
    offHour = 0;
  }
  const offMin = parseInt(offMinuteStr, 10) || 0, offMinSigned = offHour < 0 || Object.is(offHour, -0) ? -offMin : offMin;
  return offHour * 60 + offMinSigned;
}
function asNumber(value) {
  const numericValue = Number(value);
  if (typeof value === "boolean" || value === "" || Number.isNaN(numericValue))
    throw new InvalidArgumentError(`Invalid unit value ${value}`);
  return numericValue;
}
function normalizeObject(obj, normalizer) {
  const normalized = {};
  for (const u in obj) {
    if (hasOwnProperty(obj, u)) {
      const v = obj[u];
      if (v === void 0 || v === null)
        continue;
      normalized[normalizer(u)] = asNumber(v);
    }
  }
  return normalized;
}
function formatOffset(offset2, format) {
  const hours = Math.trunc(Math.abs(offset2 / 60)), minutes = Math.trunc(Math.abs(offset2 % 60)), sign = offset2 >= 0 ? "+" : "-";
  switch (format) {
    case "short":
      return `${sign}${padStart(hours, 2)}:${padStart(minutes, 2)}`;
    case "narrow":
      return `${sign}${hours}${minutes > 0 ? `:${minutes}` : ""}`;
    case "techie":
      return `${sign}${padStart(hours, 2)}${padStart(minutes, 2)}`;
    default:
      throw new RangeError(`Value format ${format} is out of range for property format`);
  }
}
function timeObject(obj) {
  return pick(obj, ["hour", "minute", "second", "millisecond"]);
}

// node_modules/luxon/src/impl/english.js
var monthsLong = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
];
var monthsShort = [
  "Jan",
  "Feb",
  "Mar",
  "Apr",
  "May",
  "Jun",
  "Jul",
  "Aug",
  "Sep",
  "Oct",
  "Nov",
  "Dec"
];
var monthsNarrow = ["J", "F", "M", "A", "M", "J", "J", "A", "S", "O", "N", "D"];
function months(length) {
  switch (length) {
    case "narrow":
      return [...monthsNarrow];
    case "short":
      return [...monthsShort];
    case "long":
      return [...monthsLong];
    case "numeric":
      return ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"];
    case "2-digit":
      return ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"];
    default:
      return null;
  }
}
var weekdaysLong = [
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
  "Sunday"
];
var weekdaysShort = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
var weekdaysNarrow = ["M", "T", "W", "T", "F", "S", "S"];
function weekdays(length) {
  switch (length) {
    case "narrow":
      return [...weekdaysNarrow];
    case "short":
      return [...weekdaysShort];
    case "long":
      return [...weekdaysLong];
    case "numeric":
      return ["1", "2", "3", "4", "5", "6", "7"];
    default:
      return null;
  }
}
var meridiems = ["AM", "PM"];
var erasLong = ["Before Christ", "Anno Domini"];
var erasShort = ["BC", "AD"];
var erasNarrow = ["B", "A"];
function eras(length) {
  switch (length) {
    case "narrow":
      return [...erasNarrow];
    case "short":
      return [...erasShort];
    case "long":
      return [...erasLong];
    default:
      return null;
  }
}
function meridiemForDateTime(dt) {
  return meridiems[dt.hour < 12 ? 0 : 1];
}
function weekdayForDateTime(dt, length) {
  return weekdays(length)[dt.weekday - 1];
}
function monthForDateTime(dt, length) {
  return months(length)[dt.month - 1];
}
function eraForDateTime(dt, length) {
  return eras(length)[dt.year < 0 ? 0 : 1];
}
function formatRelativeTime(unit, count, numeric = "always", narrow = false) {
  const units = {
    years: ["year", "yr."],
    quarters: ["quarter", "qtr."],
    months: ["month", "mo."],
    weeks: ["week", "wk."],
    days: ["day", "day", "days"],
    hours: ["hour", "hr."],
    minutes: ["minute", "min."],
    seconds: ["second", "sec."]
  };
  const lastable = ["hours", "minutes", "seconds"].indexOf(unit) === -1;
  if (numeric === "auto" && lastable) {
    const isDay = unit === "days";
    switch (count) {
      case 1:
        return isDay ? "tomorrow" : `next ${units[unit][0]}`;
      case -1:
        return isDay ? "yesterday" : `last ${units[unit][0]}`;
      case 0:
        return isDay ? "today" : `this ${units[unit][0]}`;
      default:
    }
  }
  const isInPast = Object.is(count, -0) || count < 0, fmtValue = Math.abs(count), singular = fmtValue === 1, lilUnits = units[unit], fmtUnit = narrow ? singular ? lilUnits[1] : lilUnits[2] || lilUnits[1] : singular ? units[unit][0] : unit;
  return isInPast ? `${fmtValue} ${fmtUnit} ago` : `in ${fmtValue} ${fmtUnit}`;
}

// node_modules/luxon/src/impl/formatter.js
function stringifyTokens(splits, tokenToString) {
  let s2 = "";
  for (const token of splits) {
    if (token.literal) {
      s2 += token.val;
    } else {
      s2 += tokenToString(token.val);
    }
  }
  return s2;
}
var macroTokenToFormatOpts = {
  D: DATE_SHORT,
  DD: DATE_MED,
  DDD: DATE_FULL,
  DDDD: DATE_HUGE,
  t: TIME_SIMPLE,
  tt: TIME_WITH_SECONDS,
  ttt: TIME_WITH_SHORT_OFFSET,
  tttt: TIME_WITH_LONG_OFFSET,
  T: TIME_24_SIMPLE,
  TT: TIME_24_WITH_SECONDS,
  TTT: TIME_24_WITH_SHORT_OFFSET,
  TTTT: TIME_24_WITH_LONG_OFFSET,
  f: DATETIME_SHORT,
  ff: DATETIME_MED,
  fff: DATETIME_FULL,
  ffff: DATETIME_HUGE,
  F: DATETIME_SHORT_WITH_SECONDS,
  FF: DATETIME_MED_WITH_SECONDS,
  FFF: DATETIME_FULL_WITH_SECONDS,
  FFFF: DATETIME_HUGE_WITH_SECONDS
};
var Formatter = class _Formatter {
  static create(locale, opts = {}) {
    return new _Formatter(locale, opts);
  }
  static parseFormat(fmt) {
    let current = null, currentFull = "", bracketed = false;
    const splits = [];
    for (let i = 0; i < fmt.length; i++) {
      const c = fmt.charAt(i);
      if (c === "'") {
        if (currentFull.length > 0) {
          splits.push({ literal: bracketed || /^\s+$/.test(currentFull), val: currentFull });
        }
        current = null;
        currentFull = "";
        bracketed = !bracketed;
      } else if (bracketed) {
        currentFull += c;
      } else if (c === current) {
        currentFull += c;
      } else {
        if (currentFull.length > 0) {
          splits.push({ literal: /^\s+$/.test(currentFull), val: currentFull });
        }
        currentFull = c;
        current = c;
      }
    }
    if (currentFull.length > 0) {
      splits.push({ literal: bracketed || /^\s+$/.test(currentFull), val: currentFull });
    }
    return splits;
  }
  static macroTokenToFormatOpts(token) {
    return macroTokenToFormatOpts[token];
  }
  constructor(locale, formatOpts) {
    this.opts = formatOpts;
    this.loc = locale;
    this.systemLoc = null;
  }
  formatWithSystemDefault(dt, opts) {
    if (this.systemLoc === null) {
      this.systemLoc = this.loc.redefaultToSystem();
    }
    const df = this.systemLoc.dtFormatter(dt, { ...this.opts, ...opts });
    return df.format();
  }
  dtFormatter(dt, opts = {}) {
    return this.loc.dtFormatter(dt, { ...this.opts, ...opts });
  }
  formatDateTime(dt, opts) {
    return this.dtFormatter(dt, opts).format();
  }
  formatDateTimeParts(dt, opts) {
    return this.dtFormatter(dt, opts).formatToParts();
  }
  formatInterval(interval, opts) {
    const df = this.dtFormatter(interval.start, opts);
    return df.dtf.formatRange(interval.start.toJSDate(), interval.end.toJSDate());
  }
  resolvedOptions(dt, opts) {
    return this.dtFormatter(dt, opts).resolvedOptions();
  }
  num(n2, p = 0) {
    if (this.opts.forceSimple) {
      return padStart(n2, p);
    }
    const opts = { ...this.opts };
    if (p > 0) {
      opts.padTo = p;
    }
    return this.loc.numberFormatter(opts).format(n2);
  }
  formatDateTimeFromString(dt, fmt) {
    const knownEnglish = this.loc.listingMode() === "en", useDateTimeFormatter = this.loc.outputCalendar && this.loc.outputCalendar !== "gregory", string = (opts, extract) => this.loc.extract(dt, opts, extract), formatOffset2 = (opts) => {
      if (dt.isOffsetFixed && dt.offset === 0 && opts.allowZ) {
        return "Z";
      }
      return dt.isValid ? dt.zone.formatOffset(dt.ts, opts.format) : "";
    }, meridiem = () => knownEnglish ? meridiemForDateTime(dt) : string({ hour: "numeric", hourCycle: "h12" }, "dayperiod"), month = (length, standalone) => knownEnglish ? monthForDateTime(dt, length) : string(standalone ? { month: length } : { month: length, day: "numeric" }, "month"), weekday = (length, standalone) => knownEnglish ? weekdayForDateTime(dt, length) : string(
      standalone ? { weekday: length } : { weekday: length, month: "long", day: "numeric" },
      "weekday"
    ), maybeMacro = (token) => {
      const formatOpts = _Formatter.macroTokenToFormatOpts(token);
      if (formatOpts) {
        return this.formatWithSystemDefault(dt, formatOpts);
      } else {
        return token;
      }
    }, era = (length) => knownEnglish ? eraForDateTime(dt, length) : string({ era: length }, "era"), tokenToString = (token) => {
      switch (token) {
        case "S":
          return this.num(dt.millisecond);
        case "u":
        case "SSS":
          return this.num(dt.millisecond, 3);
        case "s":
          return this.num(dt.second);
        case "ss":
          return this.num(dt.second, 2);
        case "uu":
          return this.num(Math.floor(dt.millisecond / 10), 2);
        case "uuu":
          return this.num(Math.floor(dt.millisecond / 100));
        case "m":
          return this.num(dt.minute);
        case "mm":
          return this.num(dt.minute, 2);
        case "h":
          return this.num(dt.hour % 12 === 0 ? 12 : dt.hour % 12);
        case "hh":
          return this.num(dt.hour % 12 === 0 ? 12 : dt.hour % 12, 2);
        case "H":
          return this.num(dt.hour);
        case "HH":
          return this.num(dt.hour, 2);
        case "Z":
          return formatOffset2({ format: "narrow", allowZ: this.opts.allowZ });
        case "ZZ":
          return formatOffset2({ format: "short", allowZ: this.opts.allowZ });
        case "ZZZ":
          return formatOffset2({ format: "techie", allowZ: this.opts.allowZ });
        case "ZZZZ":
          return dt.zone.offsetName(dt.ts, { format: "short", locale: this.loc.locale });
        case "ZZZZZ":
          return dt.zone.offsetName(dt.ts, { format: "long", locale: this.loc.locale });
        case "z":
          return dt.zoneName;
        case "a":
          return meridiem();
        case "d":
          return useDateTimeFormatter ? string({ day: "numeric" }, "day") : this.num(dt.day);
        case "dd":
          return useDateTimeFormatter ? string({ day: "2-digit" }, "day") : this.num(dt.day, 2);
        case "c":
          return this.num(dt.weekday);
        case "ccc":
          return weekday("short", true);
        case "cccc":
          return weekday("long", true);
        case "ccccc":
          return weekday("narrow", true);
        case "E":
          return this.num(dt.weekday);
        case "EEE":
          return weekday("short", false);
        case "EEEE":
          return weekday("long", false);
        case "EEEEE":
          return weekday("narrow", false);
        case "L":
          return useDateTimeFormatter ? string({ month: "numeric", day: "numeric" }, "month") : this.num(dt.month);
        case "LL":
          return useDateTimeFormatter ? string({ month: "2-digit", day: "numeric" }, "month") : this.num(dt.month, 2);
        case "LLL":
          return month("short", true);
        case "LLLL":
          return month("long", true);
        case "LLLLL":
          return month("narrow", true);
        case "M":
          return useDateTimeFormatter ? string({ month: "numeric" }, "month") : this.num(dt.month);
        case "MM":
          return useDateTimeFormatter ? string({ month: "2-digit" }, "month") : this.num(dt.month, 2);
        case "MMM":
          return month("short", false);
        case "MMMM":
          return month("long", false);
        case "MMMMM":
          return month("narrow", false);
        case "y":
          return useDateTimeFormatter ? string({ year: "numeric" }, "year") : this.num(dt.year);
        case "yy":
          return useDateTimeFormatter ? string({ year: "2-digit" }, "year") : this.num(dt.year.toString().slice(-2), 2);
        case "yyyy":
          return useDateTimeFormatter ? string({ year: "numeric" }, "year") : this.num(dt.year, 4);
        case "yyyyyy":
          return useDateTimeFormatter ? string({ year: "numeric" }, "year") : this.num(dt.year, 6);
        case "G":
          return era("short");
        case "GG":
          return era("long");
        case "GGGGG":
          return era("narrow");
        case "kk":
          return this.num(dt.weekYear.toString().slice(-2), 2);
        case "kkkk":
          return this.num(dt.weekYear, 4);
        case "W":
          return this.num(dt.weekNumber);
        case "WW":
          return this.num(dt.weekNumber, 2);
        case "n":
          return this.num(dt.localWeekNumber);
        case "nn":
          return this.num(dt.localWeekNumber, 2);
        case "ii":
          return this.num(dt.localWeekYear.toString().slice(-2), 2);
        case "iiii":
          return this.num(dt.localWeekYear, 4);
        case "o":
          return this.num(dt.ordinal);
        case "ooo":
          return this.num(dt.ordinal, 3);
        case "q":
          return this.num(dt.quarter);
        case "qq":
          return this.num(dt.quarter, 2);
        case "X":
          return this.num(Math.floor(dt.ts / 1e3));
        case "x":
          return this.num(dt.ts);
        default:
          return maybeMacro(token);
      }
    };
    return stringifyTokens(_Formatter.parseFormat(fmt), tokenToString);
  }
  formatDurationFromString(dur, fmt) {
    const tokenToField = (token) => {
      switch (token[0]) {
        case "S":
          return "millisecond";
        case "s":
          return "second";
        case "m":
          return "minute";
        case "h":
          return "hour";
        case "d":
          return "day";
        case "w":
          return "week";
        case "M":
          return "month";
        case "y":
          return "year";
        default:
          return null;
      }
    }, tokenToString = (lildur) => (token) => {
      const mapped = tokenToField(token);
      if (mapped) {
        return this.num(lildur.get(mapped), token.length);
      } else {
        return token;
      }
    }, tokens = _Formatter.parseFormat(fmt), realTokens = tokens.reduce(
      (found, { literal, val }) => literal ? found : found.concat(val),
      []
    ), collapsed = dur.shiftTo(...realTokens.map(tokenToField).filter((t) => t));
    return stringifyTokens(tokens, tokenToString(collapsed));
  }
};

// node_modules/luxon/src/impl/regexParser.js
var ianaRegex = /[A-Za-z_+-]{1,256}(?::?\/[A-Za-z0-9_+-]{1,256}(?:\/[A-Za-z0-9_+-]{1,256})?)?/;
function combineRegexes(...regexes) {
  const full = regexes.reduce((f, r) => f + r.source, "");
  return RegExp(`^${full}$`);
}
function combineExtractors(...extractors) {
  return (m) => extractors.reduce(
    ([mergedVals, mergedZone, cursor], ex) => {
      const [val, zone, next] = ex(m, cursor);
      return [{ ...mergedVals, ...val }, zone || mergedZone, next];
    },
    [{}, null, 1]
  ).slice(0, 2);
}
function parse(s2, ...patterns) {
  if (s2 == null) {
    return [null, null];
  }
  for (const [regex, extractor] of patterns) {
    const m = regex.exec(s2);
    if (m) {
      return extractor(m);
    }
  }
  return [null, null];
}
function simpleParse(...keys) {
  return (match2, cursor) => {
    const ret = {};
    let i;
    for (i = 0; i < keys.length; i++) {
      ret[keys[i]] = parseInteger(match2[cursor + i]);
    }
    return [ret, null, cursor + i];
  };
}
var offsetRegex = /(?:(Z)|([+-]\d\d)(?::?(\d\d))?)/;
var isoExtendedZone = `(?:${offsetRegex.source}?(?:\\[(${ianaRegex.source})\\])?)?`;
var isoTimeBaseRegex = /(\d\d)(?::?(\d\d)(?::?(\d\d)(?:[.,](\d{1,30}))?)?)?/;
var isoTimeRegex = RegExp(`${isoTimeBaseRegex.source}${isoExtendedZone}`);
var isoTimeExtensionRegex = RegExp(`(?:T${isoTimeRegex.source})?`);
var isoYmdRegex = /([+-]\d{6}|\d{4})(?:-?(\d\d)(?:-?(\d\d))?)?/;
var isoWeekRegex = /(\d{4})-?W(\d\d)(?:-?(\d))?/;
var isoOrdinalRegex = /(\d{4})-?(\d{3})/;
var extractISOWeekData = simpleParse("weekYear", "weekNumber", "weekDay");
var extractISOOrdinalData = simpleParse("year", "ordinal");
var sqlYmdRegex = /(\d{4})-(\d\d)-(\d\d)/;
var sqlTimeRegex = RegExp(
  `${isoTimeBaseRegex.source} ?(?:${offsetRegex.source}|(${ianaRegex.source}))?`
);
var sqlTimeExtensionRegex = RegExp(`(?: ${sqlTimeRegex.source})?`);
function int(match2, pos, fallback) {
  const m = match2[pos];
  return isUndefined(m) ? fallback : parseInteger(m);
}
function extractISOYmd(match2, cursor) {
  const item = {
    year: int(match2, cursor),
    month: int(match2, cursor + 1, 1),
    day: int(match2, cursor + 2, 1)
  };
  return [item, null, cursor + 3];
}
function extractISOTime(match2, cursor) {
  const item = {
    hours: int(match2, cursor, 0),
    minutes: int(match2, cursor + 1, 0),
    seconds: int(match2, cursor + 2, 0),
    milliseconds: parseMillis(match2[cursor + 3])
  };
  return [item, null, cursor + 4];
}
function extractISOOffset(match2, cursor) {
  const local = !match2[cursor] && !match2[cursor + 1], fullOffset = signedOffset(match2[cursor + 1], match2[cursor + 2]), zone = local ? null : FixedOffsetZone.instance(fullOffset);
  return [{}, zone, cursor + 3];
}
function extractIANAZone(match2, cursor) {
  const zone = match2[cursor] ? IANAZone.create(match2[cursor]) : null;
  return [{}, zone, cursor + 1];
}
var isoTimeOnly = RegExp(`^T?${isoTimeBaseRegex.source}$`);
var isoDuration = /^-?P(?:(?:(-?\d{1,20}(?:\.\d{1,20})?)Y)?(?:(-?\d{1,20}(?:\.\d{1,20})?)M)?(?:(-?\d{1,20}(?:\.\d{1,20})?)W)?(?:(-?\d{1,20}(?:\.\d{1,20})?)D)?(?:T(?:(-?\d{1,20}(?:\.\d{1,20})?)H)?(?:(-?\d{1,20}(?:\.\d{1,20})?)M)?(?:(-?\d{1,20})(?:[.,](-?\d{1,20}))?S)?)?)$/;
function extractISODuration(match2) {
  const [s2, yearStr, monthStr, weekStr, dayStr, hourStr, minuteStr, secondStr, millisecondsStr] = match2;
  const hasNegativePrefix = s2[0] === "-";
  const negativeSeconds = secondStr && secondStr[0] === "-";
  const maybeNegate = (num, force = false) => num !== void 0 && (force || num && hasNegativePrefix) ? -num : num;
  return [
    {
      years: maybeNegate(parseFloating(yearStr)),
      months: maybeNegate(parseFloating(monthStr)),
      weeks: maybeNegate(parseFloating(weekStr)),
      days: maybeNegate(parseFloating(dayStr)),
      hours: maybeNegate(parseFloating(hourStr)),
      minutes: maybeNegate(parseFloating(minuteStr)),
      seconds: maybeNegate(parseFloating(secondStr), secondStr === "-0"),
      milliseconds: maybeNegate(parseMillis(millisecondsStr), negativeSeconds)
    }
  ];
}
var obsOffsets = {
  GMT: 0,
  EDT: -4 * 60,
  EST: -5 * 60,
  CDT: -5 * 60,
  CST: -6 * 60,
  MDT: -6 * 60,
  MST: -7 * 60,
  PDT: -7 * 60,
  PST: -8 * 60
};
function fromStrings(weekdayStr, yearStr, monthStr, dayStr, hourStr, minuteStr, secondStr) {
  const result = {
    year: yearStr.length === 2 ? untruncateYear(parseInteger(yearStr)) : parseInteger(yearStr),
    month: monthsShort.indexOf(monthStr) + 1,
    day: parseInteger(dayStr),
    hour: parseInteger(hourStr),
    minute: parseInteger(minuteStr)
  };
  if (secondStr)
    result.second = parseInteger(secondStr);
  if (weekdayStr) {
    result.weekday = weekdayStr.length > 3 ? weekdaysLong.indexOf(weekdayStr) + 1 : weekdaysShort.indexOf(weekdayStr) + 1;
  }
  return result;
}
var rfc2822 = /^(?:(Mon|Tue|Wed|Thu|Fri|Sat|Sun),\s)?(\d{1,2})\s(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)\s(\d{2,4})\s(\d\d):(\d\d)(?::(\d\d))?\s(?:(UT|GMT|[ECMP][SD]T)|([Zz])|(?:([+-]\d\d)(\d\d)))$/;
function extractRFC2822(match2) {
  const [
    ,
    weekdayStr,
    dayStr,
    monthStr,
    yearStr,
    hourStr,
    minuteStr,
    secondStr,
    obsOffset,
    milOffset,
    offHourStr,
    offMinuteStr
  ] = match2, result = fromStrings(weekdayStr, yearStr, monthStr, dayStr, hourStr, minuteStr, secondStr);
  let offset2;
  if (obsOffset) {
    offset2 = obsOffsets[obsOffset];
  } else if (milOffset) {
    offset2 = 0;
  } else {
    offset2 = signedOffset(offHourStr, offMinuteStr);
  }
  return [result, new FixedOffsetZone(offset2)];
}
function preprocessRFC2822(s2) {
  return s2.replace(/\([^()]*\)|[\n\t]/g, " ").replace(/(\s\s+)/g, " ").trim();
}
var rfc1123 = /^(Mon|Tue|Wed|Thu|Fri|Sat|Sun), (\d\d) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) (\d{4}) (\d\d):(\d\d):(\d\d) GMT$/;
var rfc850 = /^(Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday), (\d\d)-(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)-(\d\d) (\d\d):(\d\d):(\d\d) GMT$/;
var ascii = /^(Mon|Tue|Wed|Thu|Fri|Sat|Sun) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) ( \d|\d\d) (\d\d):(\d\d):(\d\d) (\d{4})$/;
function extractRFC1123Or850(match2) {
  const [, weekdayStr, dayStr, monthStr, yearStr, hourStr, minuteStr, secondStr] = match2, result = fromStrings(weekdayStr, yearStr, monthStr, dayStr, hourStr, minuteStr, secondStr);
  return [result, FixedOffsetZone.utcInstance];
}
function extractASCII(match2) {
  const [, weekdayStr, monthStr, dayStr, hourStr, minuteStr, secondStr, yearStr] = match2, result = fromStrings(weekdayStr, yearStr, monthStr, dayStr, hourStr, minuteStr, secondStr);
  return [result, FixedOffsetZone.utcInstance];
}
var isoYmdWithTimeExtensionRegex = combineRegexes(isoYmdRegex, isoTimeExtensionRegex);
var isoWeekWithTimeExtensionRegex = combineRegexes(isoWeekRegex, isoTimeExtensionRegex);
var isoOrdinalWithTimeExtensionRegex = combineRegexes(isoOrdinalRegex, isoTimeExtensionRegex);
var isoTimeCombinedRegex = combineRegexes(isoTimeRegex);
var extractISOYmdTimeAndOffset = combineExtractors(
  extractISOYmd,
  extractISOTime,
  extractISOOffset,
  extractIANAZone
);
var extractISOWeekTimeAndOffset = combineExtractors(
  extractISOWeekData,
  extractISOTime,
  extractISOOffset,
  extractIANAZone
);
var extractISOOrdinalDateAndTime = combineExtractors(
  extractISOOrdinalData,
  extractISOTime,
  extractISOOffset,
  extractIANAZone
);
var extractISOTimeAndOffset = combineExtractors(
  extractISOTime,
  extractISOOffset,
  extractIANAZone
);
function parseISODate(s2) {
  return parse(
    s2,
    [isoYmdWithTimeExtensionRegex, extractISOYmdTimeAndOffset],
    [isoWeekWithTimeExtensionRegex, extractISOWeekTimeAndOffset],
    [isoOrdinalWithTimeExtensionRegex, extractISOOrdinalDateAndTime],
    [isoTimeCombinedRegex, extractISOTimeAndOffset]
  );
}
function parseRFC2822Date(s2) {
  return parse(preprocessRFC2822(s2), [rfc2822, extractRFC2822]);
}
function parseHTTPDate(s2) {
  return parse(
    s2,
    [rfc1123, extractRFC1123Or850],
    [rfc850, extractRFC1123Or850],
    [ascii, extractASCII]
  );
}
function parseISODuration(s2) {
  return parse(s2, [isoDuration, extractISODuration]);
}
var extractISOTimeOnly = combineExtractors(extractISOTime);
function parseISOTimeOnly(s2) {
  return parse(s2, [isoTimeOnly, extractISOTimeOnly]);
}
var sqlYmdWithTimeExtensionRegex = combineRegexes(sqlYmdRegex, sqlTimeExtensionRegex);
var sqlTimeCombinedRegex = combineRegexes(sqlTimeRegex);
var extractISOTimeOffsetAndIANAZone = combineExtractors(
  extractISOTime,
  extractISOOffset,
  extractIANAZone
);
function parseSQL(s2) {
  return parse(
    s2,
    [sqlYmdWithTimeExtensionRegex, extractISOYmdTimeAndOffset],
    [sqlTimeCombinedRegex, extractISOTimeOffsetAndIANAZone]
  );
}

// node_modules/luxon/src/duration.js
var INVALID = "Invalid Duration";
var lowOrderMatrix = {
  weeks: {
    days: 7,
    hours: 7 * 24,
    minutes: 7 * 24 * 60,
    seconds: 7 * 24 * 60 * 60,
    milliseconds: 7 * 24 * 60 * 60 * 1e3
  },
  days: {
    hours: 24,
    minutes: 24 * 60,
    seconds: 24 * 60 * 60,
    milliseconds: 24 * 60 * 60 * 1e3
  },
  hours: { minutes: 60, seconds: 60 * 60, milliseconds: 60 * 60 * 1e3 },
  minutes: { seconds: 60, milliseconds: 60 * 1e3 },
  seconds: { milliseconds: 1e3 }
};
var casualMatrix = {
  years: {
    quarters: 4,
    months: 12,
    weeks: 52,
    days: 365,
    hours: 365 * 24,
    minutes: 365 * 24 * 60,
    seconds: 365 * 24 * 60 * 60,
    milliseconds: 365 * 24 * 60 * 60 * 1e3
  },
  quarters: {
    months: 3,
    weeks: 13,
    days: 91,
    hours: 91 * 24,
    minutes: 91 * 24 * 60,
    seconds: 91 * 24 * 60 * 60,
    milliseconds: 91 * 24 * 60 * 60 * 1e3
  },
  months: {
    weeks: 4,
    days: 30,
    hours: 30 * 24,
    minutes: 30 * 24 * 60,
    seconds: 30 * 24 * 60 * 60,
    milliseconds: 30 * 24 * 60 * 60 * 1e3
  },
  ...lowOrderMatrix
};
var daysInYearAccurate = 146097 / 400;
var daysInMonthAccurate = 146097 / 4800;
var accurateMatrix = {
  years: {
    quarters: 4,
    months: 12,
    weeks: daysInYearAccurate / 7,
    days: daysInYearAccurate,
    hours: daysInYearAccurate * 24,
    minutes: daysInYearAccurate * 24 * 60,
    seconds: daysInYearAccurate * 24 * 60 * 60,
    milliseconds: daysInYearAccurate * 24 * 60 * 60 * 1e3
  },
  quarters: {
    months: 3,
    weeks: daysInYearAccurate / 28,
    days: daysInYearAccurate / 4,
    hours: daysInYearAccurate * 24 / 4,
    minutes: daysInYearAccurate * 24 * 60 / 4,
    seconds: daysInYearAccurate * 24 * 60 * 60 / 4,
    milliseconds: daysInYearAccurate * 24 * 60 * 60 * 1e3 / 4
  },
  months: {
    weeks: daysInMonthAccurate / 7,
    days: daysInMonthAccurate,
    hours: daysInMonthAccurate * 24,
    minutes: daysInMonthAccurate * 24 * 60,
    seconds: daysInMonthAccurate * 24 * 60 * 60,
    milliseconds: daysInMonthAccurate * 24 * 60 * 60 * 1e3
  },
  ...lowOrderMatrix
};
var orderedUnits = [
  "years",
  "quarters",
  "months",
  "weeks",
  "days",
  "hours",
  "minutes",
  "seconds",
  "milliseconds"
];
var reverseUnits = orderedUnits.slice(0).reverse();
function clone(dur, alts, clear = false) {
  const conf = {
    values: clear ? alts.values : { ...dur.values, ...alts.values || {} },
    loc: dur.loc.clone(alts.loc),
    conversionAccuracy: alts.conversionAccuracy || dur.conversionAccuracy,
    matrix: alts.matrix || dur.matrix
  };
  return new Duration(conf);
}
function durationToMillis(matrix, vals) {
  let sum = vals.milliseconds ?? 0;
  for (const unit of reverseUnits.slice(1)) {
    if (vals[unit]) {
      sum += vals[unit] * matrix[unit]["milliseconds"];
    }
  }
  return sum;
}
function normalizeValues(matrix, vals) {
  const factor = durationToMillis(matrix, vals) < 0 ? -1 : 1;
  orderedUnits.reduceRight((previous, current) => {
    if (!isUndefined(vals[current])) {
      if (previous) {
        const previousVal = vals[previous] * factor;
        const conv = matrix[current][previous];
        const rollUp = Math.floor(previousVal / conv);
        vals[current] += rollUp * factor;
        vals[previous] -= rollUp * conv * factor;
      }
      return current;
    } else {
      return previous;
    }
  }, null);
  orderedUnits.reduce((previous, current) => {
    if (!isUndefined(vals[current])) {
      if (previous) {
        const fraction = vals[previous] % 1;
        vals[previous] -= fraction;
        vals[current] += fraction * matrix[previous][current];
      }
      return current;
    } else {
      return previous;
    }
  }, null);
}
function removeZeroes(vals) {
  const newVals = {};
  for (const [key, value] of Object.entries(vals)) {
    if (value !== 0) {
      newVals[key] = value;
    }
  }
  return newVals;
}
var Duration = class _Duration {
  /**
   * @private
   */
  constructor(config) {
    const accurate = config.conversionAccuracy === "longterm" || false;
    let matrix = accurate ? accurateMatrix : casualMatrix;
    if (config.matrix) {
      matrix = config.matrix;
    }
    this.values = config.values;
    this.loc = config.loc || Locale.create();
    this.conversionAccuracy = accurate ? "longterm" : "casual";
    this.invalid = config.invalid || null;
    this.matrix = matrix;
    this.isLuxonDuration = true;
  }
  /**
   * Create Duration from a number of milliseconds.
   * @param {number} count of milliseconds
   * @param {Object} opts - options for parsing
   * @param {string} [opts.locale='en-US'] - the locale to use
   * @param {string} opts.numberingSystem - the numbering system to use
   * @param {string} [opts.conversionAccuracy='casual'] - the conversion system to use
   * @return {Duration}
   */
  static fromMillis(count, opts) {
    return _Duration.fromObject({ milliseconds: count }, opts);
  }
  /**
   * Create a Duration from a JavaScript object with keys like 'years' and 'hours'.
   * If this object is empty then a zero milliseconds duration is returned.
   * @param {Object} obj - the object to create the DateTime from
   * @param {number} obj.years
   * @param {number} obj.quarters
   * @param {number} obj.months
   * @param {number} obj.weeks
   * @param {number} obj.days
   * @param {number} obj.hours
   * @param {number} obj.minutes
   * @param {number} obj.seconds
   * @param {number} obj.milliseconds
   * @param {Object} [opts=[]] - options for creating this Duration
   * @param {string} [opts.locale='en-US'] - the locale to use
   * @param {string} opts.numberingSystem - the numbering system to use
   * @param {string} [opts.conversionAccuracy='casual'] - the preset conversion system to use
   * @param {string} [opts.matrix=Object] - the custom conversion system to use
   * @return {Duration}
   */
  static fromObject(obj, opts = {}) {
    if (obj == null || typeof obj !== "object") {
      throw new InvalidArgumentError(
        `Duration.fromObject: argument expected to be an object, got ${obj === null ? "null" : typeof obj}`
      );
    }
    return new _Duration({
      values: normalizeObject(obj, _Duration.normalizeUnit),
      loc: Locale.fromObject(opts),
      conversionAccuracy: opts.conversionAccuracy,
      matrix: opts.matrix
    });
  }
  /**
   * Create a Duration from DurationLike.
   *
   * @param {Object | number | Duration} durationLike
   * One of:
   * - object with keys like 'years' and 'hours'.
   * - number representing milliseconds
   * - Duration instance
   * @return {Duration}
   */
  static fromDurationLike(durationLike) {
    if (isNumber(durationLike)) {
      return _Duration.fromMillis(durationLike);
    } else if (_Duration.isDuration(durationLike)) {
      return durationLike;
    } else if (typeof durationLike === "object") {
      return _Duration.fromObject(durationLike);
    } else {
      throw new InvalidArgumentError(
        `Unknown duration argument ${durationLike} of type ${typeof durationLike}`
      );
    }
  }
  /**
   * Create a Duration from an ISO 8601 duration string.
   * @param {string} text - text to parse
   * @param {Object} opts - options for parsing
   * @param {string} [opts.locale='en-US'] - the locale to use
   * @param {string} opts.numberingSystem - the numbering system to use
   * @param {string} [opts.conversionAccuracy='casual'] - the preset conversion system to use
   * @param {string} [opts.matrix=Object] - the preset conversion system to use
   * @see https://en.wikipedia.org/wiki/ISO_8601#Durations
   * @example Duration.fromISO('P3Y6M1W4DT12H30M5S').toObject() //=> { years: 3, months: 6, weeks: 1, days: 4, hours: 12, minutes: 30, seconds: 5 }
   * @example Duration.fromISO('PT23H').toObject() //=> { hours: 23 }
   * @example Duration.fromISO('P5Y3M').toObject() //=> { years: 5, months: 3 }
   * @return {Duration}
   */
  static fromISO(text, opts) {
    const [parsed] = parseISODuration(text);
    if (parsed) {
      return _Duration.fromObject(parsed, opts);
    } else {
      return _Duration.invalid("unparsable", `the input "${text}" can't be parsed as ISO 8601`);
    }
  }
  /**
   * Create a Duration from an ISO 8601 time string.
   * @param {string} text - text to parse
   * @param {Object} opts - options for parsing
   * @param {string} [opts.locale='en-US'] - the locale to use
   * @param {string} opts.numberingSystem - the numbering system to use
   * @param {string} [opts.conversionAccuracy='casual'] - the preset conversion system to use
   * @param {string} [opts.matrix=Object] - the conversion system to use
   * @see https://en.wikipedia.org/wiki/ISO_8601#Times
   * @example Duration.fromISOTime('11:22:33.444').toObject() //=> { hours: 11, minutes: 22, seconds: 33, milliseconds: 444 }
   * @example Duration.fromISOTime('11:00').toObject() //=> { hours: 11, minutes: 0, seconds: 0 }
   * @example Duration.fromISOTime('T11:00').toObject() //=> { hours: 11, minutes: 0, seconds: 0 }
   * @example Duration.fromISOTime('1100').toObject() //=> { hours: 11, minutes: 0, seconds: 0 }
   * @example Duration.fromISOTime('T1100').toObject() //=> { hours: 11, minutes: 0, seconds: 0 }
   * @return {Duration}
   */
  static fromISOTime(text, opts) {
    const [parsed] = parseISOTimeOnly(text);
    if (parsed) {
      return _Duration.fromObject(parsed, opts);
    } else {
      return _Duration.invalid("unparsable", `the input "${text}" can't be parsed as ISO 8601`);
    }
  }
  /**
   * Create an invalid Duration.
   * @param {string} reason - simple string of why this datetime is invalid. Should not contain parameters or anything else data-dependent
   * @param {string} [explanation=null] - longer explanation, may include parameters and other useful debugging information
   * @return {Duration}
   */
  static invalid(reason, explanation = null) {
    if (!reason) {
      throw new InvalidArgumentError("need to specify a reason the Duration is invalid");
    }
    const invalid = reason instanceof Invalid ? reason : new Invalid(reason, explanation);
    if (Settings.throwOnInvalid) {
      throw new InvalidDurationError(invalid);
    } else {
      return new _Duration({ invalid });
    }
  }
  /**
   * @private
   */
  static normalizeUnit(unit) {
    const normalized = {
      year: "years",
      years: "years",
      quarter: "quarters",
      quarters: "quarters",
      month: "months",
      months: "months",
      week: "weeks",
      weeks: "weeks",
      day: "days",
      days: "days",
      hour: "hours",
      hours: "hours",
      minute: "minutes",
      minutes: "minutes",
      second: "seconds",
      seconds: "seconds",
      millisecond: "milliseconds",
      milliseconds: "milliseconds"
    }[unit ? unit.toLowerCase() : unit];
    if (!normalized)
      throw new InvalidUnitError(unit);
    return normalized;
  }
  /**
   * Check if an object is a Duration. Works across context boundaries
   * @param {object} o
   * @return {boolean}
   */
  static isDuration(o) {
    return o && o.isLuxonDuration || false;
  }
  /**
   * Get  the locale of a Duration, such 'en-GB'
   * @type {string}
   */
  get locale() {
    return this.isValid ? this.loc.locale : null;
  }
  /**
   * Get the numbering system of a Duration, such 'beng'. The numbering system is used when formatting the Duration
   *
   * @type {string}
   */
  get numberingSystem() {
    return this.isValid ? this.loc.numberingSystem : null;
  }
  /**
   * Returns a string representation of this Duration formatted according to the specified format string. You may use these tokens:
   * * `S` for milliseconds
   * * `s` for seconds
   * * `m` for minutes
   * * `h` for hours
   * * `d` for days
   * * `w` for weeks
   * * `M` for months
   * * `y` for years
   * Notes:
   * * Add padding by repeating the token, e.g. "yy" pads the years to two digits, "hhhh" pads the hours out to four digits
   * * Tokens can be escaped by wrapping with single quotes.
   * * The duration will be converted to the set of units in the format string using {@link Duration#shiftTo} and the Durations's conversion accuracy setting.
   * @param {string} fmt - the format string
   * @param {Object} opts - options
   * @param {boolean} [opts.floor=true] - floor numerical values
   * @example Duration.fromObject({ years: 1, days: 6, seconds: 2 }).toFormat("y d s") //=> "1 6 2"
   * @example Duration.fromObject({ years: 1, days: 6, seconds: 2 }).toFormat("yy dd sss") //=> "01 06 002"
   * @example Duration.fromObject({ years: 1, days: 6, seconds: 2 }).toFormat("M S") //=> "12 518402000"
   * @return {string}
   */
  toFormat(fmt, opts = {}) {
    const fmtOpts = {
      ...opts,
      floor: opts.round !== false && opts.floor !== false
    };
    return this.isValid ? Formatter.create(this.loc, fmtOpts).formatDurationFromString(this, fmt) : INVALID;
  }
  /**
   * Returns a string representation of a Duration with all units included.
   * To modify its behavior, use `listStyle` and any Intl.NumberFormat option, though `unitDisplay` is especially relevant.
   * @see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/NumberFormat#options
   * @param {Object} opts - Formatting options. Accepts the same keys as the options parameter of the native `Intl.NumberFormat` constructor, as well as `listStyle`.
   * @param {string} [opts.listStyle='narrow'] - How to format the merged list. Corresponds to the `style` property of the options parameter of the native `Intl.ListFormat` constructor.
   * @example
   * ```js
   * var dur = Duration.fromObject({ days: 1, hours: 5, minutes: 6 })
   * dur.toHuman() //=> '1 day, 5 hours, 6 minutes'
   * dur.toHuman({ listStyle: "long" }) //=> '1 day, 5 hours, and 6 minutes'
   * dur.toHuman({ unitDisplay: "short" }) //=> '1 day, 5 hr, 6 min'
   * ```
   */
  toHuman(opts = {}) {
    if (!this.isValid)
      return INVALID;
    const l2 = orderedUnits.map((unit) => {
      const val = this.values[unit];
      if (isUndefined(val)) {
        return null;
      }
      return this.loc.numberFormatter({ style: "unit", unitDisplay: "long", ...opts, unit: unit.slice(0, -1) }).format(val);
    }).filter((n2) => n2);
    return this.loc.listFormatter({ type: "conjunction", style: opts.listStyle || "narrow", ...opts }).format(l2);
  }
  /**
   * Returns a JavaScript object with this Duration's values.
   * @example Duration.fromObject({ years: 1, days: 6, seconds: 2 }).toObject() //=> { years: 1, days: 6, seconds: 2 }
   * @return {Object}
   */
  toObject() {
    if (!this.isValid)
      return {};
    return { ...this.values };
  }
  /**
   * Returns an ISO 8601-compliant string representation of this Duration.
   * @see https://en.wikipedia.org/wiki/ISO_8601#Durations
   * @example Duration.fromObject({ years: 3, seconds: 45 }).toISO() //=> 'P3YT45S'
   * @example Duration.fromObject({ months: 4, seconds: 45 }).toISO() //=> 'P4MT45S'
   * @example Duration.fromObject({ months: 5 }).toISO() //=> 'P5M'
   * @example Duration.fromObject({ minutes: 5 }).toISO() //=> 'PT5M'
   * @example Duration.fromObject({ milliseconds: 6 }).toISO() //=> 'PT0.006S'
   * @return {string}
   */
  toISO() {
    if (!this.isValid)
      return null;
    let s2 = "P";
    if (this.years !== 0)
      s2 += this.years + "Y";
    if (this.months !== 0 || this.quarters !== 0)
      s2 += this.months + this.quarters * 3 + "M";
    if (this.weeks !== 0)
      s2 += this.weeks + "W";
    if (this.days !== 0)
      s2 += this.days + "D";
    if (this.hours !== 0 || this.minutes !== 0 || this.seconds !== 0 || this.milliseconds !== 0)
      s2 += "T";
    if (this.hours !== 0)
      s2 += this.hours + "H";
    if (this.minutes !== 0)
      s2 += this.minutes + "M";
    if (this.seconds !== 0 || this.milliseconds !== 0)
      s2 += roundTo(this.seconds + this.milliseconds / 1e3, 3) + "S";
    if (s2 === "P")
      s2 += "T0S";
    return s2;
  }
  /**
   * Returns an ISO 8601-compliant string representation of this Duration, formatted as a time of day.
   * Note that this will return null if the duration is invalid, negative, or equal to or greater than 24 hours.
   * @see https://en.wikipedia.org/wiki/ISO_8601#Times
   * @param {Object} opts - options
   * @param {boolean} [opts.suppressMilliseconds=false] - exclude milliseconds from the format if they're 0
   * @param {boolean} [opts.suppressSeconds=false] - exclude seconds from the format if they're 0
   * @param {boolean} [opts.includePrefix=false] - include the `T` prefix
   * @param {string} [opts.format='extended'] - choose between the basic and extended format
   * @example Duration.fromObject({ hours: 11 }).toISOTime() //=> '11:00:00.000'
   * @example Duration.fromObject({ hours: 11 }).toISOTime({ suppressMilliseconds: true }) //=> '11:00:00'
   * @example Duration.fromObject({ hours: 11 }).toISOTime({ suppressSeconds: true }) //=> '11:00'
   * @example Duration.fromObject({ hours: 11 }).toISOTime({ includePrefix: true }) //=> 'T11:00:00.000'
   * @example Duration.fromObject({ hours: 11 }).toISOTime({ format: 'basic' }) //=> '110000.000'
   * @return {string}
   */
  toISOTime(opts = {}) {
    if (!this.isValid)
      return null;
    const millis = this.toMillis();
    if (millis < 0 || millis >= 864e5)
      return null;
    opts = {
      suppressMilliseconds: false,
      suppressSeconds: false,
      includePrefix: false,
      format: "extended",
      ...opts,
      includeOffset: false
    };
    const dateTime = DateTime.fromMillis(millis, { zone: "UTC" });
    return dateTime.toISOTime(opts);
  }
  /**
   * Returns an ISO 8601 representation of this Duration appropriate for use in JSON.
   * @return {string}
   */
  toJSON() {
    return this.toISO();
  }
  /**
   * Returns an ISO 8601 representation of this Duration appropriate for use in debugging.
   * @return {string}
   */
  toString() {
    return this.toISO();
  }
  /**
   * Returns a string representation of this Duration appropriate for the REPL.
   * @return {string}
   */
  [Symbol.for("nodejs.util.inspect.custom")]() {
    if (this.isValid) {
      return `Duration { values: ${JSON.stringify(this.values)} }`;
    } else {
      return `Duration { Invalid, reason: ${this.invalidReason} }`;
    }
  }
  /**
   * Returns an milliseconds value of this Duration.
   * @return {number}
   */
  toMillis() {
    if (!this.isValid)
      return NaN;
    return durationToMillis(this.matrix, this.values);
  }
  /**
   * Returns an milliseconds value of this Duration. Alias of {@link toMillis}
   * @return {number}
   */
  valueOf() {
    return this.toMillis();
  }
  /**
   * Make this Duration longer by the specified amount. Return a newly-constructed Duration.
   * @param {Duration|Object|number} duration - The amount to add. Either a Luxon Duration, a number of milliseconds, the object argument to Duration.fromObject()
   * @return {Duration}
   */
  plus(duration) {
    if (!this.isValid)
      return this;
    const dur = _Duration.fromDurationLike(duration), result = {};
    for (const k of orderedUnits) {
      if (hasOwnProperty(dur.values, k) || hasOwnProperty(this.values, k)) {
        result[k] = dur.get(k) + this.get(k);
      }
    }
    return clone(this, { values: result }, true);
  }
  /**
   * Make this Duration shorter by the specified amount. Return a newly-constructed Duration.
   * @param {Duration|Object|number} duration - The amount to subtract. Either a Luxon Duration, a number of milliseconds, the object argument to Duration.fromObject()
   * @return {Duration}
   */
  minus(duration) {
    if (!this.isValid)
      return this;
    const dur = _Duration.fromDurationLike(duration);
    return this.plus(dur.negate());
  }
  /**
   * Scale this Duration by the specified amount. Return a newly-constructed Duration.
   * @param {function} fn - The function to apply to each unit. Arity is 1 or 2: the value of the unit and, optionally, the unit name. Must return a number.
   * @example Duration.fromObject({ hours: 1, minutes: 30 }).mapUnits(x => x * 2) //=> { hours: 2, minutes: 60 }
   * @example Duration.fromObject({ hours: 1, minutes: 30 }).mapUnits((x, u) => u === "hours" ? x * 2 : x) //=> { hours: 2, minutes: 30 }
   * @return {Duration}
   */
  mapUnits(fn) {
    if (!this.isValid)
      return this;
    const result = {};
    for (const k of Object.keys(this.values)) {
      result[k] = asNumber(fn(this.values[k], k));
    }
    return clone(this, { values: result }, true);
  }
  /**
   * Get the value of unit.
   * @param {string} unit - a unit such as 'minute' or 'day'
   * @example Duration.fromObject({years: 2, days: 3}).get('years') //=> 2
   * @example Duration.fromObject({years: 2, days: 3}).get('months') //=> 0
   * @example Duration.fromObject({years: 2, days: 3}).get('days') //=> 3
   * @return {number}
   */
  get(unit) {
    return this[_Duration.normalizeUnit(unit)];
  }
  /**
   * "Set" the values of specified units. Return a newly-constructed Duration.
   * @param {Object} values - a mapping of units to numbers
   * @example dur.set({ years: 2017 })
   * @example dur.set({ hours: 8, minutes: 30 })
   * @return {Duration}
   */
  set(values) {
    if (!this.isValid)
      return this;
    const mixed = { ...this.values, ...normalizeObject(values, _Duration.normalizeUnit) };
    return clone(this, { values: mixed });
  }
  /**
   * "Set" the locale and/or numberingSystem.  Returns a newly-constructed Duration.
   * @example dur.reconfigure({ locale: 'en-GB' })
   * @return {Duration}
   */
  reconfigure({ locale, numberingSystem, conversionAccuracy, matrix } = {}) {
    const loc = this.loc.clone({ locale, numberingSystem });
    const opts = { loc, matrix, conversionAccuracy };
    return clone(this, opts);
  }
  /**
   * Return the length of the duration in the specified unit.
   * @param {string} unit - a unit such as 'minutes' or 'days'
   * @example Duration.fromObject({years: 1}).as('days') //=> 365
   * @example Duration.fromObject({years: 1}).as('months') //=> 12
   * @example Duration.fromObject({hours: 60}).as('days') //=> 2.5
   * @return {number}
   */
  as(unit) {
    return this.isValid ? this.shiftTo(unit).get(unit) : NaN;
  }
  /**
   * Reduce this Duration to its canonical representation in its current units.
   * Assuming the overall value of the Duration is positive, this means:
   * - excessive values for lower-order units are converted to higher-order units (if possible, see first and second example)
   * - negative lower-order units are converted to higher order units (there must be such a higher order unit, otherwise
   *   the overall value would be negative, see third example)
   * - fractional values for higher-order units are converted to lower-order units (if possible, see fourth example)
   *
   * If the overall value is negative, the result of this method is equivalent to `this.negate().normalize().negate()`.
   * @example Duration.fromObject({ years: 2, days: 5000 }).normalize().toObject() //=> { years: 15, days: 255 }
   * @example Duration.fromObject({ days: 5000 }).normalize().toObject() //=> { days: 5000 }
   * @example Duration.fromObject({ hours: 12, minutes: -45 }).normalize().toObject() //=> { hours: 11, minutes: 15 }
   * @example Duration.fromObject({ years: 2.5, days: 0, hours: 0 }).normalize().toObject() //=> { years: 2, days: 182, hours: 12 }
   * @return {Duration}
   */
  normalize() {
    if (!this.isValid)
      return this;
    const vals = this.toObject();
    normalizeValues(this.matrix, vals);
    return clone(this, { values: vals }, true);
  }
  /**
   * Rescale units to its largest representation
   * @example Duration.fromObject({ milliseconds: 90000 }).rescale().toObject() //=> { minutes: 1, seconds: 30 }
   * @return {Duration}
   */
  rescale() {
    if (!this.isValid)
      return this;
    const vals = removeZeroes(this.normalize().shiftToAll().toObject());
    return clone(this, { values: vals }, true);
  }
  /**
   * Convert this Duration into its representation in a different set of units.
   * @example Duration.fromObject({ hours: 1, seconds: 30 }).shiftTo('minutes', 'milliseconds').toObject() //=> { minutes: 60, milliseconds: 30000 }
   * @return {Duration}
   */
  shiftTo(...units) {
    if (!this.isValid)
      return this;
    if (units.length === 0) {
      return this;
    }
    units = units.map((u) => _Duration.normalizeUnit(u));
    const built = {}, accumulated = {}, vals = this.toObject();
    let lastUnit;
    for (const k of orderedUnits) {
      if (units.indexOf(k) >= 0) {
        lastUnit = k;
        let own = 0;
        for (const ak in accumulated) {
          own += this.matrix[ak][k] * accumulated[ak];
          accumulated[ak] = 0;
        }
        if (isNumber(vals[k])) {
          own += vals[k];
        }
        const i = Math.trunc(own);
        built[k] = i;
        accumulated[k] = (own * 1e3 - i * 1e3) / 1e3;
      } else if (isNumber(vals[k])) {
        accumulated[k] = vals[k];
      }
    }
    for (const key in accumulated) {
      if (accumulated[key] !== 0) {
        built[lastUnit] += key === lastUnit ? accumulated[key] : accumulated[key] / this.matrix[lastUnit][key];
      }
    }
    normalizeValues(this.matrix, built);
    return clone(this, { values: built }, true);
  }
  /**
   * Shift this Duration to all available units.
   * Same as shiftTo("years", "months", "weeks", "days", "hours", "minutes", "seconds", "milliseconds")
   * @return {Duration}
   */
  shiftToAll() {
    if (!this.isValid)
      return this;
    return this.shiftTo(
      "years",
      "months",
      "weeks",
      "days",
      "hours",
      "minutes",
      "seconds",
      "milliseconds"
    );
  }
  /**
   * Return the negative of this Duration.
   * @example Duration.fromObject({ hours: 1, seconds: 30 }).negate().toObject() //=> { hours: -1, seconds: -30 }
   * @return {Duration}
   */
  negate() {
    if (!this.isValid)
      return this;
    const negated = {};
    for (const k of Object.keys(this.values)) {
      negated[k] = this.values[k] === 0 ? 0 : -this.values[k];
    }
    return clone(this, { values: negated }, true);
  }
  /**
   * Get the years.
   * @type {number}
   */
  get years() {
    return this.isValid ? this.values.years || 0 : NaN;
  }
  /**
   * Get the quarters.
   * @type {number}
   */
  get quarters() {
    return this.isValid ? this.values.quarters || 0 : NaN;
  }
  /**
   * Get the months.
   * @type {number}
   */
  get months() {
    return this.isValid ? this.values.months || 0 : NaN;
  }
  /**
   * Get the weeks
   * @type {number}
   */
  get weeks() {
    return this.isValid ? this.values.weeks || 0 : NaN;
  }
  /**
   * Get the days.
   * @type {number}
   */
  get days() {
    return this.isValid ? this.values.days || 0 : NaN;
  }
  /**
   * Get the hours.
   * @type {number}
   */
  get hours() {
    return this.isValid ? this.values.hours || 0 : NaN;
  }
  /**
   * Get the minutes.
   * @type {number}
   */
  get minutes() {
    return this.isValid ? this.values.minutes || 0 : NaN;
  }
  /**
   * Get the seconds.
   * @return {number}
   */
  get seconds() {
    return this.isValid ? this.values.seconds || 0 : NaN;
  }
  /**
   * Get the milliseconds.
   * @return {number}
   */
  get milliseconds() {
    return this.isValid ? this.values.milliseconds || 0 : NaN;
  }
  /**
   * Returns whether the Duration is invalid. Invalid durations are returned by diff operations
   * on invalid DateTimes or Intervals.
   * @return {boolean}
   */
  get isValid() {
    return this.invalid === null;
  }
  /**
   * Returns an error code if this Duration became invalid, or null if the Duration is valid
   * @return {string}
   */
  get invalidReason() {
    return this.invalid ? this.invalid.reason : null;
  }
  /**
   * Returns an explanation of why this Duration became invalid, or null if the Duration is valid
   * @type {string}
   */
  get invalidExplanation() {
    return this.invalid ? this.invalid.explanation : null;
  }
  /**
   * Equality check
   * Two Durations are equal iff they have the same units and the same values for each unit.
   * @param {Duration} other
   * @return {boolean}
   */
  equals(other) {
    if (!this.isValid || !other.isValid) {
      return false;
    }
    if (!this.loc.equals(other.loc)) {
      return false;
    }
    function eq(v1, v2) {
      if (v1 === void 0 || v1 === 0)
        return v2 === void 0 || v2 === 0;
      return v1 === v2;
    }
    for (const u of orderedUnits) {
      if (!eq(this.values[u], other.values[u])) {
        return false;
      }
    }
    return true;
  }
};

// node_modules/luxon/src/interval.js
var INVALID2 = "Invalid Interval";
function validateStartEnd(start, end) {
  if (!start || !start.isValid) {
    return Interval.invalid("missing or invalid start");
  } else if (!end || !end.isValid) {
    return Interval.invalid("missing or invalid end");
  } else if (end < start) {
    return Interval.invalid(
      "end before start",
      `The end of an interval must be after its start, but you had start=${start.toISO()} and end=${end.toISO()}`
    );
  } else {
    return null;
  }
}
var Interval = class _Interval {
  /**
   * @private
   */
  constructor(config) {
    this.s = config.start;
    this.e = config.end;
    this.invalid = config.invalid || null;
    this.isLuxonInterval = true;
  }
  /**
   * Create an invalid Interval.
   * @param {string} reason - simple string of why this Interval is invalid. Should not contain parameters or anything else data-dependent
   * @param {string} [explanation=null] - longer explanation, may include parameters and other useful debugging information
   * @return {Interval}
   */
  static invalid(reason, explanation = null) {
    if (!reason) {
      throw new InvalidArgumentError("need to specify a reason the Interval is invalid");
    }
    const invalid = reason instanceof Invalid ? reason : new Invalid(reason, explanation);
    if (Settings.throwOnInvalid) {
      throw new InvalidIntervalError(invalid);
    } else {
      return new _Interval({ invalid });
    }
  }
  /**
   * Create an Interval from a start DateTime and an end DateTime. Inclusive of the start but not the end.
   * @param {DateTime|Date|Object} start
   * @param {DateTime|Date|Object} end
   * @return {Interval}
   */
  static fromDateTimes(start, end) {
    const builtStart = friendlyDateTime(start), builtEnd = friendlyDateTime(end);
    const validateError = validateStartEnd(builtStart, builtEnd);
    if (validateError == null) {
      return new _Interval({
        start: builtStart,
        end: builtEnd
      });
    } else {
      return validateError;
    }
  }
  /**
   * Create an Interval from a start DateTime and a Duration to extend to.
   * @param {DateTime|Date|Object} start
   * @param {Duration|Object|number} duration - the length of the Interval.
   * @return {Interval}
   */
  static after(start, duration) {
    const dur = Duration.fromDurationLike(duration), dt = friendlyDateTime(start);
    return _Interval.fromDateTimes(dt, dt.plus(dur));
  }
  /**
   * Create an Interval from an end DateTime and a Duration to extend backwards to.
   * @param {DateTime|Date|Object} end
   * @param {Duration|Object|number} duration - the length of the Interval.
   * @return {Interval}
   */
  static before(end, duration) {
    const dur = Duration.fromDurationLike(duration), dt = friendlyDateTime(end);
    return _Interval.fromDateTimes(dt.minus(dur), dt);
  }
  /**
   * Create an Interval from an ISO 8601 string.
   * Accepts `<start>/<end>`, `<start>/<duration>`, and `<duration>/<end>` formats.
   * @param {string} text - the ISO string to parse
   * @param {Object} [opts] - options to pass {@link DateTime#fromISO} and optionally {@link Duration#fromISO}
   * @see https://en.wikipedia.org/wiki/ISO_8601#Time_intervals
   * @return {Interval}
   */
  static fromISO(text, opts) {
    const [s2, e] = (text || "").split("/", 2);
    if (s2 && e) {
      let start, startIsValid;
      try {
        start = DateTime.fromISO(s2, opts);
        startIsValid = start.isValid;
      } catch (e2) {
        startIsValid = false;
      }
      let end, endIsValid;
      try {
        end = DateTime.fromISO(e, opts);
        endIsValid = end.isValid;
      } catch (e2) {
        endIsValid = false;
      }
      if (startIsValid && endIsValid) {
        return _Interval.fromDateTimes(start, end);
      }
      if (startIsValid) {
        const dur = Duration.fromISO(e, opts);
        if (dur.isValid) {
          return _Interval.after(start, dur);
        }
      } else if (endIsValid) {
        const dur = Duration.fromISO(s2, opts);
        if (dur.isValid) {
          return _Interval.before(end, dur);
        }
      }
    }
    return _Interval.invalid("unparsable", `the input "${text}" can't be parsed as ISO 8601`);
  }
  /**
   * Check if an object is an Interval. Works across context boundaries
   * @param {object} o
   * @return {boolean}
   */
  static isInterval(o) {
    return o && o.isLuxonInterval || false;
  }
  /**
   * Returns the start of the Interval
   * @type {DateTime}
   */
  get start() {
    return this.isValid ? this.s : null;
  }
  /**
   * Returns the end of the Interval
   * @type {DateTime}
   */
  get end() {
    return this.isValid ? this.e : null;
  }
  /**
   * Returns whether this Interval's end is at least its start, meaning that the Interval isn't 'backwards'.
   * @type {boolean}
   */
  get isValid() {
    return this.invalidReason === null;
  }
  /**
   * Returns an error code if this Interval is invalid, or null if the Interval is valid
   * @type {string}
   */
  get invalidReason() {
    return this.invalid ? this.invalid.reason : null;
  }
  /**
   * Returns an explanation of why this Interval became invalid, or null if the Interval is valid
   * @type {string}
   */
  get invalidExplanation() {
    return this.invalid ? this.invalid.explanation : null;
  }
  /**
   * Returns the length of the Interval in the specified unit.
   * @param {string} unit - the unit (such as 'hours' or 'days') to return the length in.
   * @return {number}
   */
  length(unit = "milliseconds") {
    return this.isValid ? this.toDuration(...[unit]).get(unit) : NaN;
  }
  /**
   * Returns the count of minutes, hours, days, months, or years included in the Interval, even in part.
   * Unlike {@link Interval#length} this counts sections of the calendar, not periods of time, e.g. specifying 'day'
   * asks 'what dates are included in this interval?', not 'how many days long is this interval?'
   * @param {string} [unit='milliseconds'] - the unit of time to count.
   * @param {Object} opts - options
   * @param {boolean} [opts.useLocaleWeeks=false] - If true, use weeks based on the locale, i.e. use the locale-dependent start of the week; this operation will always use the locale of the start DateTime
   * @return {number}
   */
  count(unit = "milliseconds", opts) {
    if (!this.isValid)
      return NaN;
    const start = this.start.startOf(unit, opts);
    let end;
    if (opts?.useLocaleWeeks) {
      end = this.end.reconfigure({ locale: start.locale });
    } else {
      end = this.end;
    }
    end = end.startOf(unit, opts);
    return Math.floor(end.diff(start, unit).get(unit)) + (end.valueOf() !== this.end.valueOf());
  }
  /**
   * Returns whether this Interval's start and end are both in the same unit of time
   * @param {string} unit - the unit of time to check sameness on
   * @return {boolean}
   */
  hasSame(unit) {
    return this.isValid ? this.isEmpty() || this.e.minus(1).hasSame(this.s, unit) : false;
  }
  /**
   * Return whether this Interval has the same start and end DateTimes.
   * @return {boolean}
   */
  isEmpty() {
    return this.s.valueOf() === this.e.valueOf();
  }
  /**
   * Return whether this Interval's start is after the specified DateTime.
   * @param {DateTime} dateTime
   * @return {boolean}
   */
  isAfter(dateTime) {
    if (!this.isValid)
      return false;
    return this.s > dateTime;
  }
  /**
   * Return whether this Interval's end is before the specified DateTime.
   * @param {DateTime} dateTime
   * @return {boolean}
   */
  isBefore(dateTime) {
    if (!this.isValid)
      return false;
    return this.e <= dateTime;
  }
  /**
   * Return whether this Interval contains the specified DateTime.
   * @param {DateTime} dateTime
   * @return {boolean}
   */
  contains(dateTime) {
    if (!this.isValid)
      return false;
    return this.s <= dateTime && this.e > dateTime;
  }
  /**
   * "Sets" the start and/or end dates. Returns a newly-constructed Interval.
   * @param {Object} values - the values to set
   * @param {DateTime} values.start - the starting DateTime
   * @param {DateTime} values.end - the ending DateTime
   * @return {Interval}
   */
  set({ start, end } = {}) {
    if (!this.isValid)
      return this;
    return _Interval.fromDateTimes(start || this.s, end || this.e);
  }
  /**
   * Split this Interval at each of the specified DateTimes
   * @param {...DateTime} dateTimes - the unit of time to count.
   * @return {Array}
   */
  splitAt(...dateTimes) {
    if (!this.isValid)
      return [];
    const sorted = dateTimes.map(friendlyDateTime).filter((d) => this.contains(d)).sort((a, b) => a.toMillis() - b.toMillis()), results = [];
    let { s: s2 } = this, i = 0;
    while (s2 < this.e) {
      const added = sorted[i] || this.e, next = +added > +this.e ? this.e : added;
      results.push(_Interval.fromDateTimes(s2, next));
      s2 = next;
      i += 1;
    }
    return results;
  }
  /**
   * Split this Interval into smaller Intervals, each of the specified length.
   * Left over time is grouped into a smaller interval
   * @param {Duration|Object|number} duration - The length of each resulting interval.
   * @return {Array}
   */
  splitBy(duration) {
    const dur = Duration.fromDurationLike(duration);
    if (!this.isValid || !dur.isValid || dur.as("milliseconds") === 0) {
      return [];
    }
    let { s: s2 } = this, idx = 1, next;
    const results = [];
    while (s2 < this.e) {
      const added = this.start.plus(dur.mapUnits((x) => x * idx));
      next = +added > +this.e ? this.e : added;
      results.push(_Interval.fromDateTimes(s2, next));
      s2 = next;
      idx += 1;
    }
    return results;
  }
  /**
   * Split this Interval into the specified number of smaller intervals.
   * @param {number} numberOfParts - The number of Intervals to divide the Interval into.
   * @return {Array}
   */
  divideEqually(numberOfParts) {
    if (!this.isValid)
      return [];
    return this.splitBy(this.length() / numberOfParts).slice(0, numberOfParts);
  }
  /**
   * Return whether this Interval overlaps with the specified Interval
   * @param {Interval} other
   * @return {boolean}
   */
  overlaps(other) {
    return this.e > other.s && this.s < other.e;
  }
  /**
   * Return whether this Interval's end is adjacent to the specified Interval's start.
   * @param {Interval} other
   * @return {boolean}
   */
  abutsStart(other) {
    if (!this.isValid)
      return false;
    return +this.e === +other.s;
  }
  /**
   * Return whether this Interval's start is adjacent to the specified Interval's end.
   * @param {Interval} other
   * @return {boolean}
   */
  abutsEnd(other) {
    if (!this.isValid)
      return false;
    return +other.e === +this.s;
  }
  /**
   * Return whether this Interval engulfs the start and end of the specified Interval.
   * @param {Interval} other
   * @return {boolean}
   */
  engulfs(other) {
    if (!this.isValid)
      return false;
    return this.s <= other.s && this.e >= other.e;
  }
  /**
   * Return whether this Interval has the same start and end as the specified Interval.
   * @param {Interval} other
   * @return {boolean}
   */
  equals(other) {
    if (!this.isValid || !other.isValid) {
      return false;
    }
    return this.s.equals(other.s) && this.e.equals(other.e);
  }
  /**
   * Return an Interval representing the intersection of this Interval and the specified Interval.
   * Specifically, the resulting Interval has the maximum start time and the minimum end time of the two Intervals.
   * Returns null if the intersection is empty, meaning, the intervals don't intersect.
   * @param {Interval} other
   * @return {Interval}
   */
  intersection(other) {
    if (!this.isValid)
      return this;
    const s2 = this.s > other.s ? this.s : other.s, e = this.e < other.e ? this.e : other.e;
    if (s2 >= e) {
      return null;
    } else {
      return _Interval.fromDateTimes(s2, e);
    }
  }
  /**
   * Return an Interval representing the union of this Interval and the specified Interval.
   * Specifically, the resulting Interval has the minimum start time and the maximum end time of the two Intervals.
   * @param {Interval} other
   * @return {Interval}
   */
  union(other) {
    if (!this.isValid)
      return this;
    const s2 = this.s < other.s ? this.s : other.s, e = this.e > other.e ? this.e : other.e;
    return _Interval.fromDateTimes(s2, e);
  }
  /**
   * Merge an array of Intervals into a equivalent minimal set of Intervals.
   * Combines overlapping and adjacent Intervals.
   * @param {Array} intervals
   * @return {Array}
   */
  static merge(intervals) {
    const [found, final] = intervals.sort((a, b) => a.s - b.s).reduce(
      ([sofar, current], item) => {
        if (!current) {
          return [sofar, item];
        } else if (current.overlaps(item) || current.abutsStart(item)) {
          return [sofar, current.union(item)];
        } else {
          return [sofar.concat([current]), item];
        }
      },
      [[], null]
    );
    if (final) {
      found.push(final);
    }
    return found;
  }
  /**
   * Return an array of Intervals representing the spans of time that only appear in one of the specified Intervals.
   * @param {Array} intervals
   * @return {Array}
   */
  static xor(intervals) {
    let start = null, currentCount = 0;
    const results = [], ends = intervals.map((i) => [
      { time: i.s, type: "s" },
      { time: i.e, type: "e" }
    ]), flattened = Array.prototype.concat(...ends), arr = flattened.sort((a, b) => a.time - b.time);
    for (const i of arr) {
      currentCount += i.type === "s" ? 1 : -1;
      if (currentCount === 1) {
        start = i.time;
      } else {
        if (start && +start !== +i.time) {
          results.push(_Interval.fromDateTimes(start, i.time));
        }
        start = null;
      }
    }
    return _Interval.merge(results);
  }
  /**
   * Return an Interval representing the span of time in this Interval that doesn't overlap with any of the specified Intervals.
   * @param {...Interval} intervals
   * @return {Array}
   */
  difference(...intervals) {
    return _Interval.xor([this].concat(intervals)).map((i) => this.intersection(i)).filter((i) => i && !i.isEmpty());
  }
  /**
   * Returns a string representation of this Interval appropriate for debugging.
   * @return {string}
   */
  toString() {
    if (!this.isValid)
      return INVALID2;
    return `[${this.s.toISO()} \u2013 ${this.e.toISO()})`;
  }
  /**
   * Returns a string representation of this Interval appropriate for the REPL.
   * @return {string}
   */
  [Symbol.for("nodejs.util.inspect.custom")]() {
    if (this.isValid) {
      return `Interval { start: ${this.s.toISO()}, end: ${this.e.toISO()} }`;
    } else {
      return `Interval { Invalid, reason: ${this.invalidReason} }`;
    }
  }
  /**
   * Returns a localized string representing this Interval. Accepts the same options as the
   * Intl.DateTimeFormat constructor and any presets defined by Luxon, such as
   * {@link DateTime.DATE_FULL} or {@link DateTime.TIME_SIMPLE}. The exact behavior of this method
   * is browser-specific, but in general it will return an appropriate representation of the
   * Interval in the assigned locale. Defaults to the system's locale if no locale has been
   * specified.
   * @see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/DateTimeFormat
   * @param {Object} [formatOpts=DateTime.DATE_SHORT] - Either a DateTime preset or
   * Intl.DateTimeFormat constructor options.
   * @param {Object} opts - Options to override the configuration of the start DateTime.
   * @example Interval.fromISO('2022-11-07T09:00Z/2022-11-08T09:00Z').toLocaleString(); //=> 11/7/2022 – 11/8/2022
   * @example Interval.fromISO('2022-11-07T09:00Z/2022-11-08T09:00Z').toLocaleString(DateTime.DATE_FULL); //=> November 7 – 8, 2022
   * @example Interval.fromISO('2022-11-07T09:00Z/2022-11-08T09:00Z').toLocaleString(DateTime.DATE_FULL, { locale: 'fr-FR' }); //=> 7–8 novembre 2022
   * @example Interval.fromISO('2022-11-07T17:00Z/2022-11-07T19:00Z').toLocaleString(DateTime.TIME_SIMPLE); //=> 6:00 – 8:00 PM
   * @example Interval.fromISO('2022-11-07T17:00Z/2022-11-07T19:00Z').toLocaleString({ weekday: 'short', month: 'short', day: '2-digit', hour: '2-digit', minute: '2-digit' }); //=> Mon, Nov 07, 6:00 – 8:00 p
   * @return {string}
   */
  toLocaleString(formatOpts = DATE_SHORT, opts = {}) {
    return this.isValid ? Formatter.create(this.s.loc.clone(opts), formatOpts).formatInterval(this) : INVALID2;
  }
  /**
   * Returns an ISO 8601-compliant string representation of this Interval.
   * @see https://en.wikipedia.org/wiki/ISO_8601#Time_intervals
   * @param {Object} opts - The same options as {@link DateTime#toISO}
   * @return {string}
   */
  toISO(opts) {
    if (!this.isValid)
      return INVALID2;
    return `${this.s.toISO(opts)}/${this.e.toISO(opts)}`;
  }
  /**
   * Returns an ISO 8601-compliant string representation of date of this Interval.
   * The time components are ignored.
   * @see https://en.wikipedia.org/wiki/ISO_8601#Time_intervals
   * @return {string}
   */
  toISODate() {
    if (!this.isValid)
      return INVALID2;
    return `${this.s.toISODate()}/${this.e.toISODate()}`;
  }
  /**
   * Returns an ISO 8601-compliant string representation of time of this Interval.
   * The date components are ignored.
   * @see https://en.wikipedia.org/wiki/ISO_8601#Time_intervals
   * @param {Object} opts - The same options as {@link DateTime#toISO}
   * @return {string}
   */
  toISOTime(opts) {
    if (!this.isValid)
      return INVALID2;
    return `${this.s.toISOTime(opts)}/${this.e.toISOTime(opts)}`;
  }
  /**
   * Returns a string representation of this Interval formatted according to the specified format
   * string. **You may not want this.** See {@link Interval#toLocaleString} for a more flexible
   * formatting tool.
   * @param {string} dateFormat - The format string. This string formats the start and end time.
   * See {@link DateTime#toFormat} for details.
   * @param {Object} opts - Options.
   * @param {string} [opts.separator =  ' – '] - A separator to place between the start and end
   * representations.
   * @return {string}
   */
  toFormat(dateFormat2, { separator = " \u2013 " } = {}) {
    if (!this.isValid)
      return INVALID2;
    return `${this.s.toFormat(dateFormat2)}${separator}${this.e.toFormat(dateFormat2)}`;
  }
  /**
   * Return a Duration representing the time spanned by this interval.
   * @param {string|string[]} [unit=['milliseconds']] - the unit or units (such as 'hours' or 'days') to include in the duration.
   * @param {Object} opts - options that affect the creation of the Duration
   * @param {string} [opts.conversionAccuracy='casual'] - the conversion system to use
   * @example Interval.fromDateTimes(dt1, dt2).toDuration().toObject() //=> { milliseconds: 88489257 }
   * @example Interval.fromDateTimes(dt1, dt2).toDuration('days').toObject() //=> { days: 1.0241812152777778 }
   * @example Interval.fromDateTimes(dt1, dt2).toDuration(['hours', 'minutes']).toObject() //=> { hours: 24, minutes: 34.82095 }
   * @example Interval.fromDateTimes(dt1, dt2).toDuration(['hours', 'minutes', 'seconds']).toObject() //=> { hours: 24, minutes: 34, seconds: 49.257 }
   * @example Interval.fromDateTimes(dt1, dt2).toDuration('seconds').toObject() //=> { seconds: 88489.257 }
   * @return {Duration}
   */
  toDuration(unit, opts) {
    if (!this.isValid) {
      return Duration.invalid(this.invalidReason);
    }
    return this.e.diff(this.s, unit, opts);
  }
  /**
   * Run mapFn on the interval start and end, returning a new Interval from the resulting DateTimes
   * @param {function} mapFn
   * @return {Interval}
   * @example Interval.fromDateTimes(dt1, dt2).mapEndpoints(endpoint => endpoint.toUTC())
   * @example Interval.fromDateTimes(dt1, dt2).mapEndpoints(endpoint => endpoint.plus({ hours: 2 }))
   */
  mapEndpoints(mapFn) {
    return _Interval.fromDateTimes(mapFn(this.s), mapFn(this.e));
  }
};

// node_modules/luxon/src/info.js
var Info = class {
  /**
   * Return whether the specified zone contains a DST.
   * @param {string|Zone} [zone='local'] - Zone to check. Defaults to the environment's local zone.
   * @return {boolean}
   */
  static hasDST(zone = Settings.defaultZone) {
    const proto = DateTime.now().setZone(zone).set({ month: 12 });
    return !zone.isUniversal && proto.offset !== proto.set({ month: 6 }).offset;
  }
  /**
   * Return whether the specified zone is a valid IANA specifier.
   * @param {string} zone - Zone to check
   * @return {boolean}
   */
  static isValidIANAZone(zone) {
    return IANAZone.isValidZone(zone);
  }
  /**
   * Converts the input into a {@link Zone} instance.
   *
   * * If `input` is already a Zone instance, it is returned unchanged.
   * * If `input` is a string containing a valid time zone name, a Zone instance
   *   with that name is returned.
   * * If `input` is a string that doesn't refer to a known time zone, a Zone
   *   instance with {@link Zone#isValid} == false is returned.
   * * If `input is a number, a Zone instance with the specified fixed offset
   *   in minutes is returned.
   * * If `input` is `null` or `undefined`, the default zone is returned.
   * @param {string|Zone|number} [input] - the value to be converted
   * @return {Zone}
   */
  static normalizeZone(input) {
    return normalizeZone(input, Settings.defaultZone);
  }
  /**
   * Get the weekday on which the week starts according to the given locale.
   * @param {Object} opts - options
   * @param {string} [opts.locale] - the locale code
   * @param {string} [opts.locObj=null] - an existing locale object to use
   * @returns {number} the start of the week, 1 for Monday through 7 for Sunday
   */
  static getStartOfWeek({ locale = null, locObj = null } = {}) {
    return (locObj || Locale.create(locale)).getStartOfWeek();
  }
  /**
   * Get the minimum number of days necessary in a week before it is considered part of the next year according
   * to the given locale.
   * @param {Object} opts - options
   * @param {string} [opts.locale] - the locale code
   * @param {string} [opts.locObj=null] - an existing locale object to use
   * @returns {number}
   */
  static getMinimumDaysInFirstWeek({ locale = null, locObj = null } = {}) {
    return (locObj || Locale.create(locale)).getMinDaysInFirstWeek();
  }
  /**
   * Get the weekdays, which are considered the weekend according to the given locale
   * @param {Object} opts - options
   * @param {string} [opts.locale] - the locale code
   * @param {string} [opts.locObj=null] - an existing locale object to use
   * @returns {number[]} an array of weekdays, 1 for Monday through 7 for Sunday
   */
  static getWeekendWeekdays({ locale = null, locObj = null } = {}) {
    return (locObj || Locale.create(locale)).getWeekendDays().slice();
  }
  /**
   * Return an array of standalone month names.
   * @see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/DateTimeFormat
   * @param {string} [length='long'] - the length of the month representation, such as "numeric", "2-digit", "narrow", "short", "long"
   * @param {Object} opts - options
   * @param {string} [opts.locale] - the locale code
   * @param {string} [opts.numberingSystem=null] - the numbering system
   * @param {string} [opts.locObj=null] - an existing locale object to use
   * @param {string} [opts.outputCalendar='gregory'] - the calendar
   * @example Info.months()[0] //=> 'January'
   * @example Info.months('short')[0] //=> 'Jan'
   * @example Info.months('numeric')[0] //=> '1'
   * @example Info.months('short', { locale: 'fr-CA' } )[0] //=> 'janv.'
   * @example Info.months('numeric', { locale: 'ar' })[0] //=> '١'
   * @example Info.months('long', { outputCalendar: 'islamic' })[0] //=> 'Rabiʻ I'
   * @return {Array}
   */
  static months(length = "long", { locale = null, numberingSystem = null, locObj = null, outputCalendar = "gregory" } = {}) {
    return (locObj || Locale.create(locale, numberingSystem, outputCalendar)).months(length);
  }
  /**
   * Return an array of format month names.
   * Format months differ from standalone months in that they're meant to appear next to the day of the month. In some languages, that
   * changes the string.
   * See {@link Info#months}
   * @param {string} [length='long'] - the length of the month representation, such as "numeric", "2-digit", "narrow", "short", "long"
   * @param {Object} opts - options
   * @param {string} [opts.locale] - the locale code
   * @param {string} [opts.numberingSystem=null] - the numbering system
   * @param {string} [opts.locObj=null] - an existing locale object to use
   * @param {string} [opts.outputCalendar='gregory'] - the calendar
   * @return {Array}
   */
  static monthsFormat(length = "long", { locale = null, numberingSystem = null, locObj = null, outputCalendar = "gregory" } = {}) {
    return (locObj || Locale.create(locale, numberingSystem, outputCalendar)).months(length, true);
  }
  /**
   * Return an array of standalone week names.
   * @see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/DateTimeFormat
   * @param {string} [length='long'] - the length of the weekday representation, such as "narrow", "short", "long".
   * @param {Object} opts - options
   * @param {string} [opts.locale] - the locale code
   * @param {string} [opts.numberingSystem=null] - the numbering system
   * @param {string} [opts.locObj=null] - an existing locale object to use
   * @example Info.weekdays()[0] //=> 'Monday'
   * @example Info.weekdays('short')[0] //=> 'Mon'
   * @example Info.weekdays('short', { locale: 'fr-CA' })[0] //=> 'lun.'
   * @example Info.weekdays('short', { locale: 'ar' })[0] //=> 'الاثنين'
   * @return {Array}
   */
  static weekdays(length = "long", { locale = null, numberingSystem = null, locObj = null } = {}) {
    return (locObj || Locale.create(locale, numberingSystem, null)).weekdays(length);
  }
  /**
   * Return an array of format week names.
   * Format weekdays differ from standalone weekdays in that they're meant to appear next to more date information. In some languages, that
   * changes the string.
   * See {@link Info#weekdays}
   * @param {string} [length='long'] - the length of the month representation, such as "narrow", "short", "long".
   * @param {Object} opts - options
   * @param {string} [opts.locale=null] - the locale code
   * @param {string} [opts.numberingSystem=null] - the numbering system
   * @param {string} [opts.locObj=null] - an existing locale object to use
   * @return {Array}
   */
  static weekdaysFormat(length = "long", { locale = null, numberingSystem = null, locObj = null } = {}) {
    return (locObj || Locale.create(locale, numberingSystem, null)).weekdays(length, true);
  }
  /**
   * Return an array of meridiems.
   * @param {Object} opts - options
   * @param {string} [opts.locale] - the locale code
   * @example Info.meridiems() //=> [ 'AM', 'PM' ]
   * @example Info.meridiems({ locale: 'my' }) //=> [ 'နံနက်', 'ညနေ' ]
   * @return {Array}
   */
  static meridiems({ locale = null } = {}) {
    return Locale.create(locale).meridiems();
  }
  /**
   * Return an array of eras, such as ['BC', 'AD']. The locale can be specified, but the calendar system is always Gregorian.
   * @param {string} [length='short'] - the length of the era representation, such as "short" or "long".
   * @param {Object} opts - options
   * @param {string} [opts.locale] - the locale code
   * @example Info.eras() //=> [ 'BC', 'AD' ]
   * @example Info.eras('long') //=> [ 'Before Christ', 'Anno Domini' ]
   * @example Info.eras('long', { locale: 'fr' }) //=> [ 'avant Jésus-Christ', 'après Jésus-Christ' ]
   * @return {Array}
   */
  static eras(length = "short", { locale = null } = {}) {
    return Locale.create(locale, null, "gregory").eras(length);
  }
  /**
   * Return the set of available features in this environment.
   * Some features of Luxon are not available in all environments. For example, on older browsers, relative time formatting support is not available. Use this function to figure out if that's the case.
   * Keys:
   * * `relative`: whether this environment supports relative time formatting
   * * `localeWeek`: whether this environment supports different weekdays for the start of the week based on the locale
   * @example Info.features() //=> { relative: false, localeWeek: true }
   * @return {Object}
   */
  static features() {
    return { relative: hasRelative(), localeWeek: hasLocaleWeekInfo() };
  }
};

// node_modules/luxon/src/impl/diff.js
function dayDiff(earlier, later) {
  const utcDayStart = (dt) => dt.toUTC(0, { keepLocalTime: true }).startOf("day").valueOf(), ms = utcDayStart(later) - utcDayStart(earlier);
  return Math.floor(Duration.fromMillis(ms).as("days"));
}
function highOrderDiffs(cursor, later, units) {
  const differs = [
    ["years", (a, b) => b.year - a.year],
    ["quarters", (a, b) => b.quarter - a.quarter + (b.year - a.year) * 4],
    ["months", (a, b) => b.month - a.month + (b.year - a.year) * 12],
    [
      "weeks",
      (a, b) => {
        const days = dayDiff(a, b);
        return (days - days % 7) / 7;
      }
    ],
    ["days", dayDiff]
  ];
  const results = {};
  const earlier = cursor;
  let lowestOrder, highWater;
  for (const [unit, differ] of differs) {
    if (units.indexOf(unit) >= 0) {
      lowestOrder = unit;
      results[unit] = differ(cursor, later);
      highWater = earlier.plus(results);
      if (highWater > later) {
        results[unit]--;
        cursor = earlier.plus(results);
        if (cursor > later) {
          highWater = cursor;
          results[unit]--;
          cursor = earlier.plus(results);
        }
      } else {
        cursor = highWater;
      }
    }
  }
  return [cursor, results, highWater, lowestOrder];
}
function diff_default(earlier, later, units, opts) {
  let [cursor, results, highWater, lowestOrder] = highOrderDiffs(earlier, later, units);
  const remainingMillis = later - cursor;
  const lowerOrderUnits = units.filter(
    (u) => ["hours", "minutes", "seconds", "milliseconds"].indexOf(u) >= 0
  );
  if (lowerOrderUnits.length === 0) {
    if (highWater < later) {
      highWater = cursor.plus({ [lowestOrder]: 1 });
    }
    if (highWater !== cursor) {
      results[lowestOrder] = (results[lowestOrder] || 0) + remainingMillis / (highWater - cursor);
    }
  }
  const duration = Duration.fromObject(results, opts);
  if (lowerOrderUnits.length > 0) {
    return Duration.fromMillis(remainingMillis, opts).shiftTo(...lowerOrderUnits).plus(duration);
  } else {
    return duration;
  }
}

// node_modules/luxon/src/impl/digits.js
var numberingSystems = {
  arab: "[\u0660-\u0669]",
  arabext: "[\u06F0-\u06F9]",
  bali: "[\u1B50-\u1B59]",
  beng: "[\u09E6-\u09EF]",
  deva: "[\u0966-\u096F]",
  fullwide: "[\uFF10-\uFF19]",
  gujr: "[\u0AE6-\u0AEF]",
  hanidec: "[\u3007|\u4E00|\u4E8C|\u4E09|\u56DB|\u4E94|\u516D|\u4E03|\u516B|\u4E5D]",
  khmr: "[\u17E0-\u17E9]",
  knda: "[\u0CE6-\u0CEF]",
  laoo: "[\u0ED0-\u0ED9]",
  limb: "[\u1946-\u194F]",
  mlym: "[\u0D66-\u0D6F]",
  mong: "[\u1810-\u1819]",
  mymr: "[\u1040-\u1049]",
  orya: "[\u0B66-\u0B6F]",
  tamldec: "[\u0BE6-\u0BEF]",
  telu: "[\u0C66-\u0C6F]",
  thai: "[\u0E50-\u0E59]",
  tibt: "[\u0F20-\u0F29]",
  latn: "\\d"
};
var numberingSystemsUTF16 = {
  arab: [1632, 1641],
  arabext: [1776, 1785],
  bali: [6992, 7001],
  beng: [2534, 2543],
  deva: [2406, 2415],
  fullwide: [65296, 65303],
  gujr: [2790, 2799],
  khmr: [6112, 6121],
  knda: [3302, 3311],
  laoo: [3792, 3801],
  limb: [6470, 6479],
  mlym: [3430, 3439],
  mong: [6160, 6169],
  mymr: [4160, 4169],
  orya: [2918, 2927],
  tamldec: [3046, 3055],
  telu: [3174, 3183],
  thai: [3664, 3673],
  tibt: [3872, 3881]
};
var hanidecChars = numberingSystems.hanidec.replace(/[\[|\]]/g, "").split("");
function parseDigits(str) {
  let value = parseInt(str, 10);
  if (isNaN(value)) {
    value = "";
    for (let i = 0; i < str.length; i++) {
      const code = str.charCodeAt(i);
      if (str[i].search(numberingSystems.hanidec) !== -1) {
        value += hanidecChars.indexOf(str[i]);
      } else {
        for (const key in numberingSystemsUTF16) {
          const [min, max] = numberingSystemsUTF16[key];
          if (code >= min && code <= max) {
            value += code - min;
          }
        }
      }
    }
    return parseInt(value, 10);
  } else {
    return value;
  }
}
function digitRegex({ numberingSystem }, append = "") {
  return new RegExp(`${numberingSystems[numberingSystem || "latn"]}${append}`);
}

// node_modules/luxon/src/impl/tokenParser.js
var MISSING_FTP = "missing Intl.DateTimeFormat.formatToParts support";
function intUnit(regex, post = (i) => i) {
  return { regex, deser: ([s2]) => post(parseDigits(s2)) };
}
var NBSP = String.fromCharCode(160);
var spaceOrNBSP = `[ ${NBSP}]`;
var spaceOrNBSPRegExp = new RegExp(spaceOrNBSP, "g");
function fixListRegex(s2) {
  return s2.replace(/\./g, "\\.?").replace(spaceOrNBSPRegExp, spaceOrNBSP);
}
function stripInsensitivities(s2) {
  return s2.replace(/\./g, "").replace(spaceOrNBSPRegExp, " ").toLowerCase();
}
function oneOf(strings, startIndex) {
  if (strings === null) {
    return null;
  } else {
    return {
      regex: RegExp(strings.map(fixListRegex).join("|")),
      deser: ([s2]) => strings.findIndex((i) => stripInsensitivities(s2) === stripInsensitivities(i)) + startIndex
    };
  }
}
function offset(regex, groups) {
  return { regex, deser: ([, h, m]) => signedOffset(h, m), groups };
}
function simple(regex) {
  return { regex, deser: ([s2]) => s2 };
}
function escapeToken(value) {
  return value.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g, "\\$&");
}
function unitForToken(token, loc) {
  const one = digitRegex(loc), two = digitRegex(loc, "{2}"), three = digitRegex(loc, "{3}"), four = digitRegex(loc, "{4}"), six = digitRegex(loc, "{6}"), oneOrTwo = digitRegex(loc, "{1,2}"), oneToThree = digitRegex(loc, "{1,3}"), oneToSix = digitRegex(loc, "{1,6}"), oneToNine = digitRegex(loc, "{1,9}"), twoToFour = digitRegex(loc, "{2,4}"), fourToSix = digitRegex(loc, "{4,6}"), literal = (t) => ({ regex: RegExp(escapeToken(t.val)), deser: ([s2]) => s2, literal: true }), unitate = (t) => {
    if (token.literal) {
      return literal(t);
    }
    switch (t.val) {
      case "G":
        return oneOf(loc.eras("short"), 0);
      case "GG":
        return oneOf(loc.eras("long"), 0);
      case "y":
        return intUnit(oneToSix);
      case "yy":
        return intUnit(twoToFour, untruncateYear);
      case "yyyy":
        return intUnit(four);
      case "yyyyy":
        return intUnit(fourToSix);
      case "yyyyyy":
        return intUnit(six);
      case "M":
        return intUnit(oneOrTwo);
      case "MM":
        return intUnit(two);
      case "MMM":
        return oneOf(loc.months("short", true), 1);
      case "MMMM":
        return oneOf(loc.months("long", true), 1);
      case "L":
        return intUnit(oneOrTwo);
      case "LL":
        return intUnit(two);
      case "LLL":
        return oneOf(loc.months("short", false), 1);
      case "LLLL":
        return oneOf(loc.months("long", false), 1);
      case "d":
        return intUnit(oneOrTwo);
      case "dd":
        return intUnit(two);
      case "o":
        return intUnit(oneToThree);
      case "ooo":
        return intUnit(three);
      case "HH":
        return intUnit(two);
      case "H":
        return intUnit(oneOrTwo);
      case "hh":
        return intUnit(two);
      case "h":
        return intUnit(oneOrTwo);
      case "mm":
        return intUnit(two);
      case "m":
        return intUnit(oneOrTwo);
      case "q":
        return intUnit(oneOrTwo);
      case "qq":
        return intUnit(two);
      case "s":
        return intUnit(oneOrTwo);
      case "ss":
        return intUnit(two);
      case "S":
        return intUnit(oneToThree);
      case "SSS":
        return intUnit(three);
      case "u":
        return simple(oneToNine);
      case "uu":
        return simple(oneOrTwo);
      case "uuu":
        return intUnit(one);
      case "a":
        return oneOf(loc.meridiems(), 0);
      case "kkkk":
        return intUnit(four);
      case "kk":
        return intUnit(twoToFour, untruncateYear);
      case "W":
        return intUnit(oneOrTwo);
      case "WW":
        return intUnit(two);
      case "E":
      case "c":
        return intUnit(one);
      case "EEE":
        return oneOf(loc.weekdays("short", false), 1);
      case "EEEE":
        return oneOf(loc.weekdays("long", false), 1);
      case "ccc":
        return oneOf(loc.weekdays("short", true), 1);
      case "cccc":
        return oneOf(loc.weekdays("long", true), 1);
      case "Z":
      case "ZZ":
        return offset(new RegExp(`([+-]${oneOrTwo.source})(?::(${two.source}))?`), 2);
      case "ZZZ":
        return offset(new RegExp(`([+-]${oneOrTwo.source})(${two.source})?`), 2);
      case "z":
        return simple(/[a-z_+-/]{1,256}?/i);
      case " ":
        return simple(/[^\S\n\r]/);
      default:
        return literal(t);
    }
  };
  const unit = unitate(token) || {
    invalidReason: MISSING_FTP
  };
  unit.token = token;
  return unit;
}
var partTypeStyleToTokenVal = {
  year: {
    "2-digit": "yy",
    numeric: "yyyyy"
  },
  month: {
    numeric: "M",
    "2-digit": "MM",
    short: "MMM",
    long: "MMMM"
  },
  day: {
    numeric: "d",
    "2-digit": "dd"
  },
  weekday: {
    short: "EEE",
    long: "EEEE"
  },
  dayperiod: "a",
  dayPeriod: "a",
  hour12: {
    numeric: "h",
    "2-digit": "hh"
  },
  hour24: {
    numeric: "H",
    "2-digit": "HH"
  },
  minute: {
    numeric: "m",
    "2-digit": "mm"
  },
  second: {
    numeric: "s",
    "2-digit": "ss"
  },
  timeZoneName: {
    long: "ZZZZZ",
    short: "ZZZ"
  }
};
function tokenForPart(part, formatOpts, resolvedOpts) {
  const { type, value } = part;
  if (type === "literal") {
    const isSpace = /^\s+$/.test(value);
    return {
      literal: !isSpace,
      val: isSpace ? " " : value
    };
  }
  const style = formatOpts[type];
  let actualType = type;
  if (type === "hour") {
    if (formatOpts.hour12 != null) {
      actualType = formatOpts.hour12 ? "hour12" : "hour24";
    } else if (formatOpts.hourCycle != null) {
      if (formatOpts.hourCycle === "h11" || formatOpts.hourCycle === "h12") {
        actualType = "hour12";
      } else {
        actualType = "hour24";
      }
    } else {
      actualType = resolvedOpts.hour12 ? "hour12" : "hour24";
    }
  }
  let val = partTypeStyleToTokenVal[actualType];
  if (typeof val === "object") {
    val = val[style];
  }
  if (val) {
    return {
      literal: false,
      val
    };
  }
  return void 0;
}
function buildRegex(units) {
  const re = units.map((u) => u.regex).reduce((f, r) => `${f}(${r.source})`, "");
  return [`^${re}$`, units];
}
function match(input, regex, handlers) {
  const matches = input.match(regex);
  if (matches) {
    const all = {};
    let matchIndex = 1;
    for (const i in handlers) {
      if (hasOwnProperty(handlers, i)) {
        const h = handlers[i], groups = h.groups ? h.groups + 1 : 1;
        if (!h.literal && h.token) {
          all[h.token.val[0]] = h.deser(matches.slice(matchIndex, matchIndex + groups));
        }
        matchIndex += groups;
      }
    }
    return [matches, all];
  } else {
    return [matches, {}];
  }
}
function dateTimeFromMatches(matches) {
  const toField = (token) => {
    switch (token) {
      case "S":
        return "millisecond";
      case "s":
        return "second";
      case "m":
        return "minute";
      case "h":
      case "H":
        return "hour";
      case "d":
        return "day";
      case "o":
        return "ordinal";
      case "L":
      case "M":
        return "month";
      case "y":
        return "year";
      case "E":
      case "c":
        return "weekday";
      case "W":
        return "weekNumber";
      case "k":
        return "weekYear";
      case "q":
        return "quarter";
      default:
        return null;
    }
  };
  let zone = null;
  let specificOffset;
  if (!isUndefined(matches.z)) {
    zone = IANAZone.create(matches.z);
  }
  if (!isUndefined(matches.Z)) {
    if (!zone) {
      zone = new FixedOffsetZone(matches.Z);
    }
    specificOffset = matches.Z;
  }
  if (!isUndefined(matches.q)) {
    matches.M = (matches.q - 1) * 3 + 1;
  }
  if (!isUndefined(matches.h)) {
    if (matches.h < 12 && matches.a === 1) {
      matches.h += 12;
    } else if (matches.h === 12 && matches.a === 0) {
      matches.h = 0;
    }
  }
  if (matches.G === 0 && matches.y) {
    matches.y = -matches.y;
  }
  if (!isUndefined(matches.u)) {
    matches.S = parseMillis(matches.u);
  }
  const vals = Object.keys(matches).reduce((r, k) => {
    const f = toField(k);
    if (f) {
      r[f] = matches[k];
    }
    return r;
  }, {});
  return [vals, zone, specificOffset];
}
var dummyDateTimeCache = null;
function getDummyDateTime() {
  if (!dummyDateTimeCache) {
    dummyDateTimeCache = DateTime.fromMillis(1555555555555);
  }
  return dummyDateTimeCache;
}
function maybeExpandMacroToken(token, locale) {
  if (token.literal) {
    return token;
  }
  const formatOpts = Formatter.macroTokenToFormatOpts(token.val);
  const tokens = formatOptsToTokens(formatOpts, locale);
  if (tokens == null || tokens.includes(void 0)) {
    return token;
  }
  return tokens;
}
function expandMacroTokens(tokens, locale) {
  return Array.prototype.concat(...tokens.map((t) => maybeExpandMacroToken(t, locale)));
}
function explainFromTokens(locale, input, format) {
  const tokens = expandMacroTokens(Formatter.parseFormat(format), locale), units = tokens.map((t) => unitForToken(t, locale)), disqualifyingUnit = units.find((t) => t.invalidReason);
  if (disqualifyingUnit) {
    return { input, tokens, invalidReason: disqualifyingUnit.invalidReason };
  } else {
    const [regexString, handlers] = buildRegex(units), regex = RegExp(regexString, "i"), [rawMatches, matches] = match(input, regex, handlers), [result, zone, specificOffset] = matches ? dateTimeFromMatches(matches) : [null, null, void 0];
    if (hasOwnProperty(matches, "a") && hasOwnProperty(matches, "H")) {
      throw new ConflictingSpecificationError(
        "Can't include meridiem when specifying 24-hour format"
      );
    }
    return { input, tokens, regex, rawMatches, matches, result, zone, specificOffset };
  }
}
function parseFromTokens(locale, input, format) {
  const { result, zone, specificOffset, invalidReason } = explainFromTokens(locale, input, format);
  return [result, zone, specificOffset, invalidReason];
}
function formatOptsToTokens(formatOpts, locale) {
  if (!formatOpts) {
    return null;
  }
  const formatter = Formatter.create(locale, formatOpts);
  const df = formatter.dtFormatter(getDummyDateTime());
  const parts = df.formatToParts();
  const resolvedOpts = df.resolvedOptions();
  return parts.map((p) => tokenForPart(p, formatOpts, resolvedOpts));
}

// node_modules/luxon/src/datetime.js
var INVALID3 = "Invalid DateTime";
var MAX_DATE = 864e13;
function unsupportedZone(zone) {
  return new Invalid("unsupported zone", `the zone "${zone.name}" is not supported`);
}
function possiblyCachedWeekData(dt) {
  if (dt.weekData === null) {
    dt.weekData = gregorianToWeek(dt.c);
  }
  return dt.weekData;
}
function possiblyCachedLocalWeekData(dt) {
  if (dt.localWeekData === null) {
    dt.localWeekData = gregorianToWeek(
      dt.c,
      dt.loc.getMinDaysInFirstWeek(),
      dt.loc.getStartOfWeek()
    );
  }
  return dt.localWeekData;
}
function clone2(inst, alts) {
  const current = {
    ts: inst.ts,
    zone: inst.zone,
    c: inst.c,
    o: inst.o,
    loc: inst.loc,
    invalid: inst.invalid
  };
  return new DateTime({ ...current, ...alts, old: current });
}
function fixOffset(localTS, o, tz) {
  let utcGuess = localTS - o * 60 * 1e3;
  const o2 = tz.offset(utcGuess);
  if (o === o2) {
    return [utcGuess, o];
  }
  utcGuess -= (o2 - o) * 60 * 1e3;
  const o3 = tz.offset(utcGuess);
  if (o2 === o3) {
    return [utcGuess, o2];
  }
  return [localTS - Math.min(o2, o3) * 60 * 1e3, Math.max(o2, o3)];
}
function tsToObj(ts, offset2) {
  ts += offset2 * 60 * 1e3;
  const d = new Date(ts);
  return {
    year: d.getUTCFullYear(),
    month: d.getUTCMonth() + 1,
    day: d.getUTCDate(),
    hour: d.getUTCHours(),
    minute: d.getUTCMinutes(),
    second: d.getUTCSeconds(),
    millisecond: d.getUTCMilliseconds()
  };
}
function objToTS(obj, offset2, zone) {
  return fixOffset(objToLocalTS(obj), offset2, zone);
}
function adjustTime(inst, dur) {
  const oPre = inst.o, year = inst.c.year + Math.trunc(dur.years), month = inst.c.month + Math.trunc(dur.months) + Math.trunc(dur.quarters) * 3, c = {
    ...inst.c,
    year,
    month,
    day: Math.min(inst.c.day, daysInMonth(year, month)) + Math.trunc(dur.days) + Math.trunc(dur.weeks) * 7
  }, millisToAdd = Duration.fromObject({
    years: dur.years - Math.trunc(dur.years),
    quarters: dur.quarters - Math.trunc(dur.quarters),
    months: dur.months - Math.trunc(dur.months),
    weeks: dur.weeks - Math.trunc(dur.weeks),
    days: dur.days - Math.trunc(dur.days),
    hours: dur.hours,
    minutes: dur.minutes,
    seconds: dur.seconds,
    milliseconds: dur.milliseconds
  }).as("milliseconds"), localTS = objToLocalTS(c);
  let [ts, o] = fixOffset(localTS, oPre, inst.zone);
  if (millisToAdd !== 0) {
    ts += millisToAdd;
    o = inst.zone.offset(ts);
  }
  return { ts, o };
}
function parseDataToDateTime(parsed, parsedZone, opts, format, text, specificOffset) {
  const { setZone, zone } = opts;
  if (parsed && Object.keys(parsed).length !== 0 || parsedZone) {
    const interpretationZone = parsedZone || zone, inst = DateTime.fromObject(parsed, {
      ...opts,
      zone: interpretationZone,
      specificOffset
    });
    return setZone ? inst : inst.setZone(zone);
  } else {
    return DateTime.invalid(
      new Invalid("unparsable", `the input "${text}" can't be parsed as ${format}`)
    );
  }
}
function toTechFormat(dt, format, allowZ = true) {
  return dt.isValid ? Formatter.create(Locale.create("en-US"), {
    allowZ,
    forceSimple: true
  }).formatDateTimeFromString(dt, format) : null;
}
function toISODate(o, extended) {
  const longFormat = o.c.year > 9999 || o.c.year < 0;
  let c = "";
  if (longFormat && o.c.year >= 0)
    c += "+";
  c += padStart(o.c.year, longFormat ? 6 : 4);
  if (extended) {
    c += "-";
    c += padStart(o.c.month);
    c += "-";
    c += padStart(o.c.day);
  } else {
    c += padStart(o.c.month);
    c += padStart(o.c.day);
  }
  return c;
}
function toISOTime(o, extended, suppressSeconds, suppressMilliseconds, includeOffset, extendedZone) {
  let c = padStart(o.c.hour);
  if (extended) {
    c += ":";
    c += padStart(o.c.minute);
    if (o.c.millisecond !== 0 || o.c.second !== 0 || !suppressSeconds) {
      c += ":";
    }
  } else {
    c += padStart(o.c.minute);
  }
  if (o.c.millisecond !== 0 || o.c.second !== 0 || !suppressSeconds) {
    c += padStart(o.c.second);
    if (o.c.millisecond !== 0 || !suppressMilliseconds) {
      c += ".";
      c += padStart(o.c.millisecond, 3);
    }
  }
  if (includeOffset) {
    if (o.isOffsetFixed && o.offset === 0 && !extendedZone) {
      c += "Z";
    } else if (o.o < 0) {
      c += "-";
      c += padStart(Math.trunc(-o.o / 60));
      c += ":";
      c += padStart(Math.trunc(-o.o % 60));
    } else {
      c += "+";
      c += padStart(Math.trunc(o.o / 60));
      c += ":";
      c += padStart(Math.trunc(o.o % 60));
    }
  }
  if (extendedZone) {
    c += "[" + o.zone.ianaName + "]";
  }
  return c;
}
var defaultUnitValues = {
  month: 1,
  day: 1,
  hour: 0,
  minute: 0,
  second: 0,
  millisecond: 0
};
var defaultWeekUnitValues = {
  weekNumber: 1,
  weekday: 1,
  hour: 0,
  minute: 0,
  second: 0,
  millisecond: 0
};
var defaultOrdinalUnitValues = {
  ordinal: 1,
  hour: 0,
  minute: 0,
  second: 0,
  millisecond: 0
};
var orderedUnits2 = ["year", "month", "day", "hour", "minute", "second", "millisecond"];
var orderedWeekUnits = [
  "weekYear",
  "weekNumber",
  "weekday",
  "hour",
  "minute",
  "second",
  "millisecond"
];
var orderedOrdinalUnits = ["year", "ordinal", "hour", "minute", "second", "millisecond"];
function normalizeUnit(unit) {
  const normalized = {
    year: "year",
    years: "year",
    month: "month",
    months: "month",
    day: "day",
    days: "day",
    hour: "hour",
    hours: "hour",
    minute: "minute",
    minutes: "minute",
    quarter: "quarter",
    quarters: "quarter",
    second: "second",
    seconds: "second",
    millisecond: "millisecond",
    milliseconds: "millisecond",
    weekday: "weekday",
    weekdays: "weekday",
    weeknumber: "weekNumber",
    weeksnumber: "weekNumber",
    weeknumbers: "weekNumber",
    weekyear: "weekYear",
    weekyears: "weekYear",
    ordinal: "ordinal"
  }[unit.toLowerCase()];
  if (!normalized)
    throw new InvalidUnitError(unit);
  return normalized;
}
function normalizeUnitWithLocalWeeks(unit) {
  switch (unit.toLowerCase()) {
    case "localweekday":
    case "localweekdays":
      return "localWeekday";
    case "localweeknumber":
    case "localweeknumbers":
      return "localWeekNumber";
    case "localweekyear":
    case "localweekyears":
      return "localWeekYear";
    default:
      return normalizeUnit(unit);
  }
}
function quickDT(obj, opts) {
  const zone = normalizeZone(opts.zone, Settings.defaultZone), loc = Locale.fromObject(opts), tsNow = Settings.now();
  let ts, o;
  if (!isUndefined(obj.year)) {
    for (const u of orderedUnits2) {
      if (isUndefined(obj[u])) {
        obj[u] = defaultUnitValues[u];
      }
    }
    const invalid = hasInvalidGregorianData(obj) || hasInvalidTimeData(obj);
    if (invalid) {
      return DateTime.invalid(invalid);
    }
    const offsetProvis = zone.offset(tsNow);
    [ts, o] = objToTS(obj, offsetProvis, zone);
  } else {
    ts = tsNow;
  }
  return new DateTime({ ts, zone, loc, o });
}
function diffRelative(start, end, opts) {
  const round = isUndefined(opts.round) ? true : opts.round, format = (c, unit) => {
    c = roundTo(c, round || opts.calendary ? 0 : 2, true);
    const formatter = end.loc.clone(opts).relFormatter(opts);
    return formatter.format(c, unit);
  }, differ = (unit) => {
    if (opts.calendary) {
      if (!end.hasSame(start, unit)) {
        return end.startOf(unit).diff(start.startOf(unit), unit).get(unit);
      } else
        return 0;
    } else {
      return end.diff(start, unit).get(unit);
    }
  };
  if (opts.unit) {
    return format(differ(opts.unit), opts.unit);
  }
  for (const unit of opts.units) {
    const count = differ(unit);
    if (Math.abs(count) >= 1) {
      return format(count, unit);
    }
  }
  return format(start > end ? -0 : 0, opts.units[opts.units.length - 1]);
}
function lastOpts(argList) {
  let opts = {}, args;
  if (argList.length > 0 && typeof argList[argList.length - 1] === "object") {
    opts = argList[argList.length - 1];
    args = Array.from(argList).slice(0, argList.length - 1);
  } else {
    args = Array.from(argList);
  }
  return [opts, args];
}
var DateTime = class _DateTime {
  /**
   * @access private
   */
  constructor(config) {
    const zone = config.zone || Settings.defaultZone;
    let invalid = config.invalid || (Number.isNaN(config.ts) ? new Invalid("invalid input") : null) || (!zone.isValid ? unsupportedZone(zone) : null);
    this.ts = isUndefined(config.ts) ? Settings.now() : config.ts;
    let c = null, o = null;
    if (!invalid) {
      const unchanged = config.old && config.old.ts === this.ts && config.old.zone.equals(zone);
      if (unchanged) {
        [c, o] = [config.old.c, config.old.o];
      } else {
        const ot = zone.offset(this.ts);
        c = tsToObj(this.ts, ot);
        invalid = Number.isNaN(c.year) ? new Invalid("invalid input") : null;
        c = invalid ? null : c;
        o = invalid ? null : ot;
      }
    }
    this._zone = zone;
    this.loc = config.loc || Locale.create();
    this.invalid = invalid;
    this.weekData = null;
    this.localWeekData = null;
    this.c = c;
    this.o = o;
    this.isLuxonDateTime = true;
  }
  // CONSTRUCT
  /**
   * Create a DateTime for the current instant, in the system's time zone.
   *
   * Use Settings to override these default values if needed.
   * @example DateTime.now().toISO() //~> now in the ISO format
   * @return {DateTime}
   */
  static now() {
    return new _DateTime({});
  }
  /**
   * Create a local DateTime
   * @param {number} [year] - The calendar year. If omitted (as in, call `local()` with no arguments), the current time will be used
   * @param {number} [month=1] - The month, 1-indexed
   * @param {number} [day=1] - The day of the month, 1-indexed
   * @param {number} [hour=0] - The hour of the day, in 24-hour time
   * @param {number} [minute=0] - The minute of the hour, meaning a number between 0 and 59
   * @param {number} [second=0] - The second of the minute, meaning a number between 0 and 59
   * @param {number} [millisecond=0] - The millisecond of the second, meaning a number between 0 and 999
   * @example DateTime.local()                                  //~> now
   * @example DateTime.local({ zone: "America/New_York" })      //~> now, in US east coast time
   * @example DateTime.local(2017)                              //~> 2017-01-01T00:00:00
   * @example DateTime.local(2017, 3)                           //~> 2017-03-01T00:00:00
   * @example DateTime.local(2017, 3, 12, { locale: "fr" })     //~> 2017-03-12T00:00:00, with a French locale
   * @example DateTime.local(2017, 3, 12, 5)                    //~> 2017-03-12T05:00:00
   * @example DateTime.local(2017, 3, 12, 5, { zone: "utc" })   //~> 2017-03-12T05:00:00, in UTC
   * @example DateTime.local(2017, 3, 12, 5, 45)                //~> 2017-03-12T05:45:00
   * @example DateTime.local(2017, 3, 12, 5, 45, 10)            //~> 2017-03-12T05:45:10
   * @example DateTime.local(2017, 3, 12, 5, 45, 10, 765)       //~> 2017-03-12T05:45:10.765
   * @return {DateTime}
   */
  static local() {
    const [opts, args] = lastOpts(arguments), [year, month, day, hour, minute, second, millisecond] = args;
    return quickDT({ year, month, day, hour, minute, second, millisecond }, opts);
  }
  /**
   * Create a DateTime in UTC
   * @param {number} [year] - The calendar year. If omitted (as in, call `utc()` with no arguments), the current time will be used
   * @param {number} [month=1] - The month, 1-indexed
   * @param {number} [day=1] - The day of the month
   * @param {number} [hour=0] - The hour of the day, in 24-hour time
   * @param {number} [minute=0] - The minute of the hour, meaning a number between 0 and 59
   * @param {number} [second=0] - The second of the minute, meaning a number between 0 and 59
   * @param {number} [millisecond=0] - The millisecond of the second, meaning a number between 0 and 999
   * @param {Object} options - configuration options for the DateTime
   * @param {string} [options.locale] - a locale to set on the resulting DateTime instance
   * @param {string} [options.outputCalendar] - the output calendar to set on the resulting DateTime instance
   * @param {string} [options.numberingSystem] - the numbering system to set on the resulting DateTime instance
   * @example DateTime.utc()                                              //~> now
   * @example DateTime.utc(2017)                                          //~> 2017-01-01T00:00:00Z
   * @example DateTime.utc(2017, 3)                                       //~> 2017-03-01T00:00:00Z
   * @example DateTime.utc(2017, 3, 12)                                   //~> 2017-03-12T00:00:00Z
   * @example DateTime.utc(2017, 3, 12, 5)                                //~> 2017-03-12T05:00:00Z
   * @example DateTime.utc(2017, 3, 12, 5, 45)                            //~> 2017-03-12T05:45:00Z
   * @example DateTime.utc(2017, 3, 12, 5, 45, { locale: "fr" })          //~> 2017-03-12T05:45:00Z with a French locale
   * @example DateTime.utc(2017, 3, 12, 5, 45, 10)                        //~> 2017-03-12T05:45:10Z
   * @example DateTime.utc(2017, 3, 12, 5, 45, 10, 765, { locale: "fr" }) //~> 2017-03-12T05:45:10.765Z with a French locale
   * @return {DateTime}
   */
  static utc() {
    const [opts, args] = lastOpts(arguments), [year, month, day, hour, minute, second, millisecond] = args;
    opts.zone = FixedOffsetZone.utcInstance;
    return quickDT({ year, month, day, hour, minute, second, millisecond }, opts);
  }
  /**
   * Create a DateTime from a JavaScript Date object. Uses the default zone.
   * @param {Date} date - a JavaScript Date object
   * @param {Object} options - configuration options for the DateTime
   * @param {string|Zone} [options.zone='local'] - the zone to place the DateTime into
   * @return {DateTime}
   */
  static fromJSDate(date, options = {}) {
    const ts = isDate(date) ? date.valueOf() : NaN;
    if (Number.isNaN(ts)) {
      return _DateTime.invalid("invalid input");
    }
    const zoneToUse = normalizeZone(options.zone, Settings.defaultZone);
    if (!zoneToUse.isValid) {
      return _DateTime.invalid(unsupportedZone(zoneToUse));
    }
    return new _DateTime({
      ts,
      zone: zoneToUse,
      loc: Locale.fromObject(options)
    });
  }
  /**
   * Create a DateTime from a number of milliseconds since the epoch (meaning since 1 January 1970 00:00:00 UTC). Uses the default zone.
   * @param {number} milliseconds - a number of milliseconds since 1970 UTC
   * @param {Object} options - configuration options for the DateTime
   * @param {string|Zone} [options.zone='local'] - the zone to place the DateTime into
   * @param {string} [options.locale] - a locale to set on the resulting DateTime instance
   * @param {string} options.outputCalendar - the output calendar to set on the resulting DateTime instance
   * @param {string} options.numberingSystem - the numbering system to set on the resulting DateTime instance
   * @return {DateTime}
   */
  static fromMillis(milliseconds, options = {}) {
    if (!isNumber(milliseconds)) {
      throw new InvalidArgumentError(
        `fromMillis requires a numerical input, but received a ${typeof milliseconds} with value ${milliseconds}`
      );
    } else if (milliseconds < -MAX_DATE || milliseconds > MAX_DATE) {
      return _DateTime.invalid("Timestamp out of range");
    } else {
      return new _DateTime({
        ts: milliseconds,
        zone: normalizeZone(options.zone, Settings.defaultZone),
        loc: Locale.fromObject(options)
      });
    }
  }
  /**
   * Create a DateTime from a number of seconds since the epoch (meaning since 1 January 1970 00:00:00 UTC). Uses the default zone.
   * @param {number} seconds - a number of seconds since 1970 UTC
   * @param {Object} options - configuration options for the DateTime
   * @param {string|Zone} [options.zone='local'] - the zone to place the DateTime into
   * @param {string} [options.locale] - a locale to set on the resulting DateTime instance
   * @param {string} options.outputCalendar - the output calendar to set on the resulting DateTime instance
   * @param {string} options.numberingSystem - the numbering system to set on the resulting DateTime instance
   * @return {DateTime}
   */
  static fromSeconds(seconds, options = {}) {
    if (!isNumber(seconds)) {
      throw new InvalidArgumentError("fromSeconds requires a numerical input");
    } else {
      return new _DateTime({
        ts: seconds * 1e3,
        zone: normalizeZone(options.zone, Settings.defaultZone),
        loc: Locale.fromObject(options)
      });
    }
  }
  /**
   * Create a DateTime from a JavaScript object with keys like 'year' and 'hour' with reasonable defaults.
   * @param {Object} obj - the object to create the DateTime from
   * @param {number} obj.year - a year, such as 1987
   * @param {number} obj.month - a month, 1-12
   * @param {number} obj.day - a day of the month, 1-31, depending on the month
   * @param {number} obj.ordinal - day of the year, 1-365 or 366
   * @param {number} obj.weekYear - an ISO week year
   * @param {number} obj.weekNumber - an ISO week number, between 1 and 52 or 53, depending on the year
   * @param {number} obj.weekday - an ISO weekday, 1-7, where 1 is Monday and 7 is Sunday
   * @param {number} obj.localWeekYear - a week year, according to the locale
   * @param {number} obj.localWeekNumber - a week number, between 1 and 52 or 53, depending on the year, according to the locale
   * @param {number} obj.localWeekday - a weekday, 1-7, where 1 is the first and 7 is the last day of the week, according to the locale
   * @param {number} obj.hour - hour of the day, 0-23
   * @param {number} obj.minute - minute of the hour, 0-59
   * @param {number} obj.second - second of the minute, 0-59
   * @param {number} obj.millisecond - millisecond of the second, 0-999
   * @param {Object} opts - options for creating this DateTime
   * @param {string|Zone} [opts.zone='local'] - interpret the numbers in the context of a particular zone. Can take any value taken as the first argument to setZone()
   * @param {string} [opts.locale='system\'s locale'] - a locale to set on the resulting DateTime instance
   * @param {string} opts.outputCalendar - the output calendar to set on the resulting DateTime instance
   * @param {string} opts.numberingSystem - the numbering system to set on the resulting DateTime instance
   * @example DateTime.fromObject({ year: 1982, month: 5, day: 25}).toISODate() //=> '1982-05-25'
   * @example DateTime.fromObject({ year: 1982 }).toISODate() //=> '1982-01-01'
   * @example DateTime.fromObject({ hour: 10, minute: 26, second: 6 }) //~> today at 10:26:06
   * @example DateTime.fromObject({ hour: 10, minute: 26, second: 6 }, { zone: 'utc' }),
   * @example DateTime.fromObject({ hour: 10, minute: 26, second: 6 }, { zone: 'local' })
   * @example DateTime.fromObject({ hour: 10, minute: 26, second: 6 }, { zone: 'America/New_York' })
   * @example DateTime.fromObject({ weekYear: 2016, weekNumber: 2, weekday: 3 }).toISODate() //=> '2016-01-13'
   * @example DateTime.fromObject({ localWeekYear: 2022, localWeekNumber: 1, localWeekday: 1 }, { locale: "en-US" }).toISODate() //=> '2021-12-26'
   * @return {DateTime}
   */
  static fromObject(obj, opts = {}) {
    obj = obj || {};
    const zoneToUse = normalizeZone(opts.zone, Settings.defaultZone);
    if (!zoneToUse.isValid) {
      return _DateTime.invalid(unsupportedZone(zoneToUse));
    }
    const loc = Locale.fromObject(opts);
    const normalized = normalizeObject(obj, normalizeUnitWithLocalWeeks);
    const { minDaysInFirstWeek, startOfWeek } = usesLocalWeekValues(normalized, loc);
    const tsNow = Settings.now(), offsetProvis = !isUndefined(opts.specificOffset) ? opts.specificOffset : zoneToUse.offset(tsNow), containsOrdinal = !isUndefined(normalized.ordinal), containsGregorYear = !isUndefined(normalized.year), containsGregorMD = !isUndefined(normalized.month) || !isUndefined(normalized.day), containsGregor = containsGregorYear || containsGregorMD, definiteWeekDef = normalized.weekYear || normalized.weekNumber;
    if ((containsGregor || containsOrdinal) && definiteWeekDef) {
      throw new ConflictingSpecificationError(
        "Can't mix weekYear/weekNumber units with year/month/day or ordinals"
      );
    }
    if (containsGregorMD && containsOrdinal) {
      throw new ConflictingSpecificationError("Can't mix ordinal dates with month/day");
    }
    const useWeekData = definiteWeekDef || normalized.weekday && !containsGregor;
    let units, defaultValues, objNow = tsToObj(tsNow, offsetProvis);
    if (useWeekData) {
      units = orderedWeekUnits;
      defaultValues = defaultWeekUnitValues;
      objNow = gregorianToWeek(objNow, minDaysInFirstWeek, startOfWeek);
    } else if (containsOrdinal) {
      units = orderedOrdinalUnits;
      defaultValues = defaultOrdinalUnitValues;
      objNow = gregorianToOrdinal(objNow);
    } else {
      units = orderedUnits2;
      defaultValues = defaultUnitValues;
    }
    let foundFirst = false;
    for (const u of units) {
      const v = normalized[u];
      if (!isUndefined(v)) {
        foundFirst = true;
      } else if (foundFirst) {
        normalized[u] = defaultValues[u];
      } else {
        normalized[u] = objNow[u];
      }
    }
    const higherOrderInvalid = useWeekData ? hasInvalidWeekData(normalized, minDaysInFirstWeek, startOfWeek) : containsOrdinal ? hasInvalidOrdinalData(normalized) : hasInvalidGregorianData(normalized), invalid = higherOrderInvalid || hasInvalidTimeData(normalized);
    if (invalid) {
      return _DateTime.invalid(invalid);
    }
    const gregorian = useWeekData ? weekToGregorian(normalized, minDaysInFirstWeek, startOfWeek) : containsOrdinal ? ordinalToGregorian(normalized) : normalized, [tsFinal, offsetFinal] = objToTS(gregorian, offsetProvis, zoneToUse), inst = new _DateTime({
      ts: tsFinal,
      zone: zoneToUse,
      o: offsetFinal,
      loc
    });
    if (normalized.weekday && containsGregor && obj.weekday !== inst.weekday) {
      return _DateTime.invalid(
        "mismatched weekday",
        `you can't specify both a weekday of ${normalized.weekday} and a date of ${inst.toISO()}`
      );
    }
    return inst;
  }
  /**
   * Create a DateTime from an ISO 8601 string
   * @param {string} text - the ISO string
   * @param {Object} opts - options to affect the creation
   * @param {string|Zone} [opts.zone='local'] - use this zone if no offset is specified in the input string itself. Will also convert the time to this zone
   * @param {boolean} [opts.setZone=false] - override the zone with a fixed-offset zone specified in the string itself, if it specifies one
   * @param {string} [opts.locale='system's locale'] - a locale to set on the resulting DateTime instance
   * @param {string} [opts.outputCalendar] - the output calendar to set on the resulting DateTime instance
   * @param {string} [opts.numberingSystem] - the numbering system to set on the resulting DateTime instance
   * @example DateTime.fromISO('2016-05-25T09:08:34.123')
   * @example DateTime.fromISO('2016-05-25T09:08:34.123+06:00')
   * @example DateTime.fromISO('2016-05-25T09:08:34.123+06:00', {setZone: true})
   * @example DateTime.fromISO('2016-05-25T09:08:34.123', {zone: 'utc'})
   * @example DateTime.fromISO('2016-W05-4')
   * @return {DateTime}
   */
  static fromISO(text, opts = {}) {
    const [vals, parsedZone] = parseISODate(text);
    return parseDataToDateTime(vals, parsedZone, opts, "ISO 8601", text);
  }
  /**
   * Create a DateTime from an RFC 2822 string
   * @param {string} text - the RFC 2822 string
   * @param {Object} opts - options to affect the creation
   * @param {string|Zone} [opts.zone='local'] - convert the time to this zone. Since the offset is always specified in the string itself, this has no effect on the interpretation of string, merely the zone the resulting DateTime is expressed in.
   * @param {boolean} [opts.setZone=false] - override the zone with a fixed-offset zone specified in the string itself, if it specifies one
   * @param {string} [opts.locale='system's locale'] - a locale to set on the resulting DateTime instance
   * @param {string} opts.outputCalendar - the output calendar to set on the resulting DateTime instance
   * @param {string} opts.numberingSystem - the numbering system to set on the resulting DateTime instance
   * @example DateTime.fromRFC2822('25 Nov 2016 13:23:12 GMT')
   * @example DateTime.fromRFC2822('Fri, 25 Nov 2016 13:23:12 +0600')
   * @example DateTime.fromRFC2822('25 Nov 2016 13:23 Z')
   * @return {DateTime}
   */
  static fromRFC2822(text, opts = {}) {
    const [vals, parsedZone] = parseRFC2822Date(text);
    return parseDataToDateTime(vals, parsedZone, opts, "RFC 2822", text);
  }
  /**
   * Create a DateTime from an HTTP header date
   * @see https://www.w3.org/Protocols/rfc2616/rfc2616-sec3.html#sec3.3.1
   * @param {string} text - the HTTP header date
   * @param {Object} opts - options to affect the creation
   * @param {string|Zone} [opts.zone='local'] - convert the time to this zone. Since HTTP dates are always in UTC, this has no effect on the interpretation of string, merely the zone the resulting DateTime is expressed in.
   * @param {boolean} [opts.setZone=false] - override the zone with the fixed-offset zone specified in the string. For HTTP dates, this is always UTC, so this option is equivalent to setting the `zone` option to 'utc', but this option is included for consistency with similar methods.
   * @param {string} [opts.locale='system's locale'] - a locale to set on the resulting DateTime instance
   * @param {string} opts.outputCalendar - the output calendar to set on the resulting DateTime instance
   * @param {string} opts.numberingSystem - the numbering system to set on the resulting DateTime instance
   * @example DateTime.fromHTTP('Sun, 06 Nov 1994 08:49:37 GMT')
   * @example DateTime.fromHTTP('Sunday, 06-Nov-94 08:49:37 GMT')
   * @example DateTime.fromHTTP('Sun Nov  6 08:49:37 1994')
   * @return {DateTime}
   */
  static fromHTTP(text, opts = {}) {
    const [vals, parsedZone] = parseHTTPDate(text);
    return parseDataToDateTime(vals, parsedZone, opts, "HTTP", opts);
  }
  /**
   * Create a DateTime from an input string and format string.
   * Defaults to en-US if no locale has been specified, regardless of the system's locale. For a table of tokens and their interpretations, see [here](https://moment.github.io/luxon/#/parsing?id=table-of-tokens).
   * @param {string} text - the string to parse
   * @param {string} fmt - the format the string is expected to be in (see the link below for the formats)
   * @param {Object} opts - options to affect the creation
   * @param {string|Zone} [opts.zone='local'] - use this zone if no offset is specified in the input string itself. Will also convert the DateTime to this zone
   * @param {boolean} [opts.setZone=false] - override the zone with a zone specified in the string itself, if it specifies one
   * @param {string} [opts.locale='en-US'] - a locale string to use when parsing. Will also set the DateTime to this locale
   * @param {string} opts.numberingSystem - the numbering system to use when parsing. Will also set the resulting DateTime to this numbering system
   * @param {string} opts.outputCalendar - the output calendar to set on the resulting DateTime instance
   * @return {DateTime}
   */
  static fromFormat(text, fmt, opts = {}) {
    if (isUndefined(text) || isUndefined(fmt)) {
      throw new InvalidArgumentError("fromFormat requires an input string and a format");
    }
    const { locale = null, numberingSystem = null } = opts, localeToUse = Locale.fromOpts({
      locale,
      numberingSystem,
      defaultToEN: true
    }), [vals, parsedZone, specificOffset, invalid] = parseFromTokens(localeToUse, text, fmt);
    if (invalid) {
      return _DateTime.invalid(invalid);
    } else {
      return parseDataToDateTime(vals, parsedZone, opts, `format ${fmt}`, text, specificOffset);
    }
  }
  /**
   * @deprecated use fromFormat instead
   */
  static fromString(text, fmt, opts = {}) {
    return _DateTime.fromFormat(text, fmt, opts);
  }
  /**
   * Create a DateTime from a SQL date, time, or datetime
   * Defaults to en-US if no locale has been specified, regardless of the system's locale
   * @param {string} text - the string to parse
   * @param {Object} opts - options to affect the creation
   * @param {string|Zone} [opts.zone='local'] - use this zone if no offset is specified in the input string itself. Will also convert the DateTime to this zone
   * @param {boolean} [opts.setZone=false] - override the zone with a zone specified in the string itself, if it specifies one
   * @param {string} [opts.locale='en-US'] - a locale string to use when parsing. Will also set the DateTime to this locale
   * @param {string} opts.numberingSystem - the numbering system to use when parsing. Will also set the resulting DateTime to this numbering system
   * @param {string} opts.outputCalendar - the output calendar to set on the resulting DateTime instance
   * @example DateTime.fromSQL('2017-05-15')
   * @example DateTime.fromSQL('2017-05-15 09:12:34')
   * @example DateTime.fromSQL('2017-05-15 09:12:34.342')
   * @example DateTime.fromSQL('2017-05-15 09:12:34.342+06:00')
   * @example DateTime.fromSQL('2017-05-15 09:12:34.342 America/Los_Angeles')
   * @example DateTime.fromSQL('2017-05-15 09:12:34.342 America/Los_Angeles', { setZone: true })
   * @example DateTime.fromSQL('2017-05-15 09:12:34.342', { zone: 'America/Los_Angeles' })
   * @example DateTime.fromSQL('09:12:34.342')
   * @return {DateTime}
   */
  static fromSQL(text, opts = {}) {
    const [vals, parsedZone] = parseSQL(text);
    return parseDataToDateTime(vals, parsedZone, opts, "SQL", text);
  }
  /**
   * Create an invalid DateTime.
   * @param {string} reason - simple string of why this DateTime is invalid. Should not contain parameters or anything else data-dependent.
   * @param {string} [explanation=null] - longer explanation, may include parameters and other useful debugging information
   * @return {DateTime}
   */
  static invalid(reason, explanation = null) {
    if (!reason) {
      throw new InvalidArgumentError("need to specify a reason the DateTime is invalid");
    }
    const invalid = reason instanceof Invalid ? reason : new Invalid(reason, explanation);
    if (Settings.throwOnInvalid) {
      throw new InvalidDateTimeError(invalid);
    } else {
      return new _DateTime({ invalid });
    }
  }
  /**
   * Check if an object is an instance of DateTime. Works across context boundaries
   * @param {object} o
   * @return {boolean}
   */
  static isDateTime(o) {
    return o && o.isLuxonDateTime || false;
  }
  /**
   * Produce the format string for a set of options
   * @param formatOpts
   * @param localeOpts
   * @returns {string}
   */
  static parseFormatForOpts(formatOpts, localeOpts = {}) {
    const tokenList = formatOptsToTokens(formatOpts, Locale.fromObject(localeOpts));
    return !tokenList ? null : tokenList.map((t) => t ? t.val : null).join("");
  }
  /**
   * Produce the the fully expanded format token for the locale
   * Does NOT quote characters, so quoted tokens will not round trip correctly
   * @param fmt
   * @param localeOpts
   * @returns {string}
   */
  static expandFormat(fmt, localeOpts = {}) {
    const expanded = expandMacroTokens(Formatter.parseFormat(fmt), Locale.fromObject(localeOpts));
    return expanded.map((t) => t.val).join("");
  }
  // INFO
  /**
   * Get the value of unit.
   * @param {string} unit - a unit such as 'minute' or 'day'
   * @example DateTime.local(2017, 7, 4).get('month'); //=> 7
   * @example DateTime.local(2017, 7, 4).get('day'); //=> 4
   * @return {number}
   */
  get(unit) {
    return this[unit];
  }
  /**
   * Returns whether the DateTime is valid. Invalid DateTimes occur when:
   * * The DateTime was created from invalid calendar information, such as the 13th month or February 30
   * * The DateTime was created by an operation on another invalid date
   * @type {boolean}
   */
  get isValid() {
    return this.invalid === null;
  }
  /**
   * Returns an error code if this DateTime is invalid, or null if the DateTime is valid
   * @type {string}
   */
  get invalidReason() {
    return this.invalid ? this.invalid.reason : null;
  }
  /**
   * Returns an explanation of why this DateTime became invalid, or null if the DateTime is valid
   * @type {string}
   */
  get invalidExplanation() {
    return this.invalid ? this.invalid.explanation : null;
  }
  /**
   * Get the locale of a DateTime, such 'en-GB'. The locale is used when formatting the DateTime
   *
   * @type {string}
   */
  get locale() {
    return this.isValid ? this.loc.locale : null;
  }
  /**
   * Get the numbering system of a DateTime, such 'beng'. The numbering system is used when formatting the DateTime
   *
   * @type {string}
   */
  get numberingSystem() {
    return this.isValid ? this.loc.numberingSystem : null;
  }
  /**
   * Get the output calendar of a DateTime, such 'islamic'. The output calendar is used when formatting the DateTime
   *
   * @type {string}
   */
  get outputCalendar() {
    return this.isValid ? this.loc.outputCalendar : null;
  }
  /**
   * Get the time zone associated with this DateTime.
   * @type {Zone}
   */
  get zone() {
    return this._zone;
  }
  /**
   * Get the name of the time zone.
   * @type {string}
   */
  get zoneName() {
    return this.isValid ? this.zone.name : null;
  }
  /**
   * Get the year
   * @example DateTime.local(2017, 5, 25).year //=> 2017
   * @type {number}
   */
  get year() {
    return this.isValid ? this.c.year : NaN;
  }
  /**
   * Get the quarter
   * @example DateTime.local(2017, 5, 25).quarter //=> 2
   * @type {number}
   */
  get quarter() {
    return this.isValid ? Math.ceil(this.c.month / 3) : NaN;
  }
  /**
   * Get the month (1-12).
   * @example DateTime.local(2017, 5, 25).month //=> 5
   * @type {number}
   */
  get month() {
    return this.isValid ? this.c.month : NaN;
  }
  /**
   * Get the day of the month (1-30ish).
   * @example DateTime.local(2017, 5, 25).day //=> 25
   * @type {number}
   */
  get day() {
    return this.isValid ? this.c.day : NaN;
  }
  /**
   * Get the hour of the day (0-23).
   * @example DateTime.local(2017, 5, 25, 9).hour //=> 9
   * @type {number}
   */
  get hour() {
    return this.isValid ? this.c.hour : NaN;
  }
  /**
   * Get the minute of the hour (0-59).
   * @example DateTime.local(2017, 5, 25, 9, 30).minute //=> 30
   * @type {number}
   */
  get minute() {
    return this.isValid ? this.c.minute : NaN;
  }
  /**
   * Get the second of the minute (0-59).
   * @example DateTime.local(2017, 5, 25, 9, 30, 52).second //=> 52
   * @type {number}
   */
  get second() {
    return this.isValid ? this.c.second : NaN;
  }
  /**
   * Get the millisecond of the second (0-999).
   * @example DateTime.local(2017, 5, 25, 9, 30, 52, 654).millisecond //=> 654
   * @type {number}
   */
  get millisecond() {
    return this.isValid ? this.c.millisecond : NaN;
  }
  /**
   * Get the week year
   * @see https://en.wikipedia.org/wiki/ISO_week_date
   * @example DateTime.local(2014, 12, 31).weekYear //=> 2015
   * @type {number}
   */
  get weekYear() {
    return this.isValid ? possiblyCachedWeekData(this).weekYear : NaN;
  }
  /**
   * Get the week number of the week year (1-52ish).
   * @see https://en.wikipedia.org/wiki/ISO_week_date
   * @example DateTime.local(2017, 5, 25).weekNumber //=> 21
   * @type {number}
   */
  get weekNumber() {
    return this.isValid ? possiblyCachedWeekData(this).weekNumber : NaN;
  }
  /**
   * Get the day of the week.
   * 1 is Monday and 7 is Sunday
   * @see https://en.wikipedia.org/wiki/ISO_week_date
   * @example DateTime.local(2014, 11, 31).weekday //=> 4
   * @type {number}
   */
  get weekday() {
    return this.isValid ? possiblyCachedWeekData(this).weekday : NaN;
  }
  /**
   * Returns true if this date is on a weekend according to the locale, false otherwise
   * @returns {boolean}
   */
  get isWeekend() {
    return this.isValid && this.loc.getWeekendDays().includes(this.weekday);
  }
  /**
   * Get the day of the week according to the locale.
   * 1 is the first day of the week and 7 is the last day of the week.
   * If the locale assigns Sunday as the first day of the week, then a date which is a Sunday will return 1,
   * @returns {number}
   */
  get localWeekday() {
    return this.isValid ? possiblyCachedLocalWeekData(this).weekday : NaN;
  }
  /**
   * Get the week number of the week year according to the locale. Different locales assign week numbers differently,
   * because the week can start on different days of the week (see localWeekday) and because a different number of days
   * is required for a week to count as the first week of a year.
   * @returns {number}
   */
  get localWeekNumber() {
    return this.isValid ? possiblyCachedLocalWeekData(this).weekNumber : NaN;
  }
  /**
   * Get the week year according to the locale. Different locales assign week numbers (and therefor week years)
   * differently, see localWeekNumber.
   * @returns {number}
   */
  get localWeekYear() {
    return this.isValid ? possiblyCachedLocalWeekData(this).weekYear : NaN;
  }
  /**
   * Get the ordinal (meaning the day of the year)
   * @example DateTime.local(2017, 5, 25).ordinal //=> 145
   * @type {number|DateTime}
   */
  get ordinal() {
    return this.isValid ? gregorianToOrdinal(this.c).ordinal : NaN;
  }
  /**
   * Get the human readable short month name, such as 'Oct'.
   * Defaults to the system's locale if no locale has been specified
   * @example DateTime.local(2017, 10, 30).monthShort //=> Oct
   * @type {string}
   */
  get monthShort() {
    return this.isValid ? Info.months("short", { locObj: this.loc })[this.month - 1] : null;
  }
  /**
   * Get the human readable long month name, such as 'October'.
   * Defaults to the system's locale if no locale has been specified
   * @example DateTime.local(2017, 10, 30).monthLong //=> October
   * @type {string}
   */
  get monthLong() {
    return this.isValid ? Info.months("long", { locObj: this.loc })[this.month - 1] : null;
  }
  /**
   * Get the human readable short weekday, such as 'Mon'.
   * Defaults to the system's locale if no locale has been specified
   * @example DateTime.local(2017, 10, 30).weekdayShort //=> Mon
   * @type {string}
   */
  get weekdayShort() {
    return this.isValid ? Info.weekdays("short", { locObj: this.loc })[this.weekday - 1] : null;
  }
  /**
   * Get the human readable long weekday, such as 'Monday'.
   * Defaults to the system's locale if no locale has been specified
   * @example DateTime.local(2017, 10, 30).weekdayLong //=> Monday
   * @type {string}
   */
  get weekdayLong() {
    return this.isValid ? Info.weekdays("long", { locObj: this.loc })[this.weekday - 1] : null;
  }
  /**
   * Get the UTC offset of this DateTime in minutes
   * @example DateTime.now().offset //=> -240
   * @example DateTime.utc().offset //=> 0
   * @type {number}
   */
  get offset() {
    return this.isValid ? +this.o : NaN;
  }
  /**
   * Get the short human name for the zone's current offset, for example "EST" or "EDT".
   * Defaults to the system's locale if no locale has been specified
   * @type {string}
   */
  get offsetNameShort() {
    if (this.isValid) {
      return this.zone.offsetName(this.ts, {
        format: "short",
        locale: this.locale
      });
    } else {
      return null;
    }
  }
  /**
   * Get the long human name for the zone's current offset, for example "Eastern Standard Time" or "Eastern Daylight Time".
   * Defaults to the system's locale if no locale has been specified
   * @type {string}
   */
  get offsetNameLong() {
    if (this.isValid) {
      return this.zone.offsetName(this.ts, {
        format: "long",
        locale: this.locale
      });
    } else {
      return null;
    }
  }
  /**
   * Get whether this zone's offset ever changes, as in a DST.
   * @type {boolean}
   */
  get isOffsetFixed() {
    return this.isValid ? this.zone.isUniversal : null;
  }
  /**
   * Get whether the DateTime is in a DST.
   * @type {boolean}
   */
  get isInDST() {
    if (this.isOffsetFixed) {
      return false;
    } else {
      return this.offset > this.set({ month: 1, day: 1 }).offset || this.offset > this.set({ month: 5 }).offset;
    }
  }
  /**
   * Get those DateTimes which have the same local time as this DateTime, but a different offset from UTC
   * in this DateTime's zone. During DST changes local time can be ambiguous, for example
   * `2023-10-29T02:30:00` in `Europe/Berlin` can have offset `+01:00` or `+02:00`.
   * This method will return both possible DateTimes if this DateTime's local time is ambiguous.
   * @returns {DateTime[]}
   */
  getPossibleOffsets() {
    if (!this.isValid || this.isOffsetFixed) {
      return [this];
    }
    const dayMs = 864e5;
    const minuteMs = 6e4;
    const localTS = objToLocalTS(this.c);
    const oEarlier = this.zone.offset(localTS - dayMs);
    const oLater = this.zone.offset(localTS + dayMs);
    const o1 = this.zone.offset(localTS - oEarlier * minuteMs);
    const o2 = this.zone.offset(localTS - oLater * minuteMs);
    if (o1 === o2) {
      return [this];
    }
    const ts1 = localTS - o1 * minuteMs;
    const ts2 = localTS - o2 * minuteMs;
    const c1 = tsToObj(ts1, o1);
    const c2 = tsToObj(ts2, o2);
    if (c1.hour === c2.hour && c1.minute === c2.minute && c1.second === c2.second && c1.millisecond === c2.millisecond) {
      return [clone2(this, { ts: ts1 }), clone2(this, { ts: ts2 })];
    }
    return [this];
  }
  /**
   * Returns true if this DateTime is in a leap year, false otherwise
   * @example DateTime.local(2016).isInLeapYear //=> true
   * @example DateTime.local(2013).isInLeapYear //=> false
   * @type {boolean}
   */
  get isInLeapYear() {
    return isLeapYear(this.year);
  }
  /**
   * Returns the number of days in this DateTime's month
   * @example DateTime.local(2016, 2).daysInMonth //=> 29
   * @example DateTime.local(2016, 3).daysInMonth //=> 31
   * @type {number}
   */
  get daysInMonth() {
    return daysInMonth(this.year, this.month);
  }
  /**
   * Returns the number of days in this DateTime's year
   * @example DateTime.local(2016).daysInYear //=> 366
   * @example DateTime.local(2013).daysInYear //=> 365
   * @type {number}
   */
  get daysInYear() {
    return this.isValid ? daysInYear(this.year) : NaN;
  }
  /**
   * Returns the number of weeks in this DateTime's year
   * @see https://en.wikipedia.org/wiki/ISO_week_date
   * @example DateTime.local(2004).weeksInWeekYear //=> 53
   * @example DateTime.local(2013).weeksInWeekYear //=> 52
   * @type {number}
   */
  get weeksInWeekYear() {
    return this.isValid ? weeksInWeekYear(this.weekYear) : NaN;
  }
  /**
   * Returns the number of weeks in this DateTime's local week year
   * @example DateTime.local(2020, 6, {locale: 'en-US'}).weeksInLocalWeekYear //=> 52
   * @example DateTime.local(2020, 6, {locale: 'de-DE'}).weeksInLocalWeekYear //=> 53
   * @type {number}
   */
  get weeksInLocalWeekYear() {
    return this.isValid ? weeksInWeekYear(
      this.localWeekYear,
      this.loc.getMinDaysInFirstWeek(),
      this.loc.getStartOfWeek()
    ) : NaN;
  }
  /**
   * Returns the resolved Intl options for this DateTime.
   * This is useful in understanding the behavior of formatting methods
   * @param {Object} opts - the same options as toLocaleString
   * @return {Object}
   */
  resolvedLocaleOptions(opts = {}) {
    const { locale, numberingSystem, calendar } = Formatter.create(
      this.loc.clone(opts),
      opts
    ).resolvedOptions(this);
    return { locale, numberingSystem, outputCalendar: calendar };
  }
  // TRANSFORM
  /**
   * "Set" the DateTime's zone to UTC. Returns a newly-constructed DateTime.
   *
   * Equivalent to {@link DateTime#setZone}('utc')
   * @param {number} [offset=0] - optionally, an offset from UTC in minutes
   * @param {Object} [opts={}] - options to pass to `setZone()`
   * @return {DateTime}
   */
  toUTC(offset2 = 0, opts = {}) {
    return this.setZone(FixedOffsetZone.instance(offset2), opts);
  }
  /**
   * "Set" the DateTime's zone to the host's local zone. Returns a newly-constructed DateTime.
   *
   * Equivalent to `setZone('local')`
   * @return {DateTime}
   */
  toLocal() {
    return this.setZone(Settings.defaultZone);
  }
  /**
   * "Set" the DateTime's zone to specified zone. Returns a newly-constructed DateTime.
   *
   * By default, the setter keeps the underlying time the same (as in, the same timestamp), but the new instance will report different local times and consider DSTs when making computations, as with {@link DateTime#plus}. You may wish to use {@link DateTime#toLocal} and {@link DateTime#toUTC} which provide simple convenience wrappers for commonly used zones.
   * @param {string|Zone} [zone='local'] - a zone identifier. As a string, that can be any IANA zone supported by the host environment, or a fixed-offset name of the form 'UTC+3', or the strings 'local' or 'utc'. You may also supply an instance of a {@link DateTime#Zone} class.
   * @param {Object} opts - options
   * @param {boolean} [opts.keepLocalTime=false] - If true, adjust the underlying time so that the local time stays the same, but in the target zone. You should rarely need this.
   * @return {DateTime}
   */
  setZone(zone, { keepLocalTime = false, keepCalendarTime = false } = {}) {
    zone = normalizeZone(zone, Settings.defaultZone);
    if (zone.equals(this.zone)) {
      return this;
    } else if (!zone.isValid) {
      return _DateTime.invalid(unsupportedZone(zone));
    } else {
      let newTS = this.ts;
      if (keepLocalTime || keepCalendarTime) {
        const offsetGuess = zone.offset(this.ts);
        const asObj = this.toObject();
        [newTS] = objToTS(asObj, offsetGuess, zone);
      }
      return clone2(this, { ts: newTS, zone });
    }
  }
  /**
   * "Set" the locale, numberingSystem, or outputCalendar. Returns a newly-constructed DateTime.
   * @param {Object} properties - the properties to set
   * @example DateTime.local(2017, 5, 25).reconfigure({ locale: 'en-GB' })
   * @return {DateTime}
   */
  reconfigure({ locale, numberingSystem, outputCalendar } = {}) {
    const loc = this.loc.clone({ locale, numberingSystem, outputCalendar });
    return clone2(this, { loc });
  }
  /**
   * "Set" the locale. Returns a newly-constructed DateTime.
   * Just a convenient alias for reconfigure({ locale })
   * @example DateTime.local(2017, 5, 25).setLocale('en-GB')
   * @return {DateTime}
   */
  setLocale(locale) {
    return this.reconfigure({ locale });
  }
  /**
   * "Set" the values of specified units. Returns a newly-constructed DateTime.
   * You can only set units with this method; for "setting" metadata, see {@link DateTime#reconfigure} and {@link DateTime#setZone}.
   *
   * This method also supports setting locale-based week units, i.e. `localWeekday`, `localWeekNumber` and `localWeekYear`.
   * They cannot be mixed with ISO-week units like `weekday`.
   * @param {Object} values - a mapping of units to numbers
   * @example dt.set({ year: 2017 })
   * @example dt.set({ hour: 8, minute: 30 })
   * @example dt.set({ weekday: 5 })
   * @example dt.set({ year: 2005, ordinal: 234 })
   * @return {DateTime}
   */
  set(values) {
    if (!this.isValid)
      return this;
    const normalized = normalizeObject(values, normalizeUnitWithLocalWeeks);
    const { minDaysInFirstWeek, startOfWeek } = usesLocalWeekValues(normalized, this.loc);
    const settingWeekStuff = !isUndefined(normalized.weekYear) || !isUndefined(normalized.weekNumber) || !isUndefined(normalized.weekday), containsOrdinal = !isUndefined(normalized.ordinal), containsGregorYear = !isUndefined(normalized.year), containsGregorMD = !isUndefined(normalized.month) || !isUndefined(normalized.day), containsGregor = containsGregorYear || containsGregorMD, definiteWeekDef = normalized.weekYear || normalized.weekNumber;
    if ((containsGregor || containsOrdinal) && definiteWeekDef) {
      throw new ConflictingSpecificationError(
        "Can't mix weekYear/weekNumber units with year/month/day or ordinals"
      );
    }
    if (containsGregorMD && containsOrdinal) {
      throw new ConflictingSpecificationError("Can't mix ordinal dates with month/day");
    }
    let mixed;
    if (settingWeekStuff) {
      mixed = weekToGregorian(
        { ...gregorianToWeek(this.c, minDaysInFirstWeek, startOfWeek), ...normalized },
        minDaysInFirstWeek,
        startOfWeek
      );
    } else if (!isUndefined(normalized.ordinal)) {
      mixed = ordinalToGregorian({ ...gregorianToOrdinal(this.c), ...normalized });
    } else {
      mixed = { ...this.toObject(), ...normalized };
      if (isUndefined(normalized.day)) {
        mixed.day = Math.min(daysInMonth(mixed.year, mixed.month), mixed.day);
      }
    }
    const [ts, o] = objToTS(mixed, this.o, this.zone);
    return clone2(this, { ts, o });
  }
  /**
   * Add a period of time to this DateTime and return the resulting DateTime
   *
   * Adding hours, minutes, seconds, or milliseconds increases the timestamp by the right number of milliseconds. Adding days, months, or years shifts the calendar, accounting for DSTs and leap years along the way. Thus, `dt.plus({ hours: 24 })` may result in a different time than `dt.plus({ days: 1 })` if there's a DST shift in between.
   * @param {Duration|Object|number} duration - The amount to add. Either a Luxon Duration, a number of milliseconds, the object argument to Duration.fromObject()
   * @example DateTime.now().plus(123) //~> in 123 milliseconds
   * @example DateTime.now().plus({ minutes: 15 }) //~> in 15 minutes
   * @example DateTime.now().plus({ days: 1 }) //~> this time tomorrow
   * @example DateTime.now().plus({ days: -1 }) //~> this time yesterday
   * @example DateTime.now().plus({ hours: 3, minutes: 13 }) //~> in 3 hr, 13 min
   * @example DateTime.now().plus(Duration.fromObject({ hours: 3, minutes: 13 })) //~> in 3 hr, 13 min
   * @return {DateTime}
   */
  plus(duration) {
    if (!this.isValid)
      return this;
    const dur = Duration.fromDurationLike(duration);
    return clone2(this, adjustTime(this, dur));
  }
  /**
   * Subtract a period of time to this DateTime and return the resulting DateTime
   * See {@link DateTime#plus}
   * @param {Duration|Object|number} duration - The amount to subtract. Either a Luxon Duration, a number of milliseconds, the object argument to Duration.fromObject()
   @return {DateTime}
   */
  minus(duration) {
    if (!this.isValid)
      return this;
    const dur = Duration.fromDurationLike(duration).negate();
    return clone2(this, adjustTime(this, dur));
  }
  /**
   * "Set" this DateTime to the beginning of a unit of time.
   * @param {string} unit - The unit to go to the beginning of. Can be 'year', 'quarter', 'month', 'week', 'day', 'hour', 'minute', 'second', or 'millisecond'.
   * @param {Object} opts - options
   * @param {boolean} [opts.useLocaleWeeks=false] - If true, use weeks based on the locale, i.e. use the locale-dependent start of the week
   * @example DateTime.local(2014, 3, 3).startOf('month').toISODate(); //=> '2014-03-01'
   * @example DateTime.local(2014, 3, 3).startOf('year').toISODate(); //=> '2014-01-01'
   * @example DateTime.local(2014, 3, 3).startOf('week').toISODate(); //=> '2014-03-03', weeks always start on Mondays
   * @example DateTime.local(2014, 3, 3, 5, 30).startOf('day').toISOTime(); //=> '00:00.000-05:00'
   * @example DateTime.local(2014, 3, 3, 5, 30).startOf('hour').toISOTime(); //=> '05:00:00.000-05:00'
   * @return {DateTime}
   */
  startOf(unit, { useLocaleWeeks = false } = {}) {
    if (!this.isValid)
      return this;
    const o = {}, normalizedUnit = Duration.normalizeUnit(unit);
    switch (normalizedUnit) {
      case "years":
        o.month = 1;
      case "quarters":
      case "months":
        o.day = 1;
      case "weeks":
      case "days":
        o.hour = 0;
      case "hours":
        o.minute = 0;
      case "minutes":
        o.second = 0;
      case "seconds":
        o.millisecond = 0;
        break;
      case "milliseconds":
        break;
    }
    if (normalizedUnit === "weeks") {
      if (useLocaleWeeks) {
        const startOfWeek = this.loc.getStartOfWeek();
        const { weekday } = this;
        if (weekday < startOfWeek) {
          o.weekNumber = this.weekNumber - 1;
        }
        o.weekday = startOfWeek;
      } else {
        o.weekday = 1;
      }
    }
    if (normalizedUnit === "quarters") {
      const q = Math.ceil(this.month / 3);
      o.month = (q - 1) * 3 + 1;
    }
    return this.set(o);
  }
  /**
   * "Set" this DateTime to the end (meaning the last millisecond) of a unit of time
   * @param {string} unit - The unit to go to the end of. Can be 'year', 'quarter', 'month', 'week', 'day', 'hour', 'minute', 'second', or 'millisecond'.
   * @param {Object} opts - options
   * @param {boolean} [opts.useLocaleWeeks=false] - If true, use weeks based on the locale, i.e. use the locale-dependent start of the week
   * @example DateTime.local(2014, 3, 3).endOf('month').toISO(); //=> '2014-03-31T23:59:59.999-05:00'
   * @example DateTime.local(2014, 3, 3).endOf('year').toISO(); //=> '2014-12-31T23:59:59.999-05:00'
   * @example DateTime.local(2014, 3, 3).endOf('week').toISO(); // => '2014-03-09T23:59:59.999-05:00', weeks start on Mondays
   * @example DateTime.local(2014, 3, 3, 5, 30).endOf('day').toISO(); //=> '2014-03-03T23:59:59.999-05:00'
   * @example DateTime.local(2014, 3, 3, 5, 30).endOf('hour').toISO(); //=> '2014-03-03T05:59:59.999-05:00'
   * @return {DateTime}
   */
  endOf(unit, opts) {
    return this.isValid ? this.plus({ [unit]: 1 }).startOf(unit, opts).minus(1) : this;
  }
  // OUTPUT
  /**
   * Returns a string representation of this DateTime formatted according to the specified format string.
   * **You may not want this.** See {@link DateTime#toLocaleString} for a more flexible formatting tool. For a table of tokens and their interpretations, see [here](https://moment.github.io/luxon/#/formatting?id=table-of-tokens).
   * Defaults to en-US if no locale has been specified, regardless of the system's locale.
   * @param {string} fmt - the format string
   * @param {Object} opts - opts to override the configuration options on this DateTime
   * @example DateTime.now().toFormat('yyyy LLL dd') //=> '2017 Apr 22'
   * @example DateTime.now().setLocale('fr').toFormat('yyyy LLL dd') //=> '2017 avr. 22'
   * @example DateTime.now().toFormat('yyyy LLL dd', { locale: "fr" }) //=> '2017 avr. 22'
   * @example DateTime.now().toFormat("HH 'hours and' mm 'minutes'") //=> '20 hours and 55 minutes'
   * @return {string}
   */
  toFormat(fmt, opts = {}) {
    return this.isValid ? Formatter.create(this.loc.redefaultToEN(opts)).formatDateTimeFromString(this, fmt) : INVALID3;
  }
  /**
   * Returns a localized string representing this date. Accepts the same options as the Intl.DateTimeFormat constructor and any presets defined by Luxon, such as `DateTime.DATE_FULL` or `DateTime.TIME_SIMPLE`.
   * The exact behavior of this method is browser-specific, but in general it will return an appropriate representation
   * of the DateTime in the assigned locale.
   * Defaults to the system's locale if no locale has been specified
   * @see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/DateTimeFormat
   * @param formatOpts {Object} - Intl.DateTimeFormat constructor options and configuration options
   * @param {Object} opts - opts to override the configuration options on this DateTime
   * @example DateTime.now().toLocaleString(); //=> 4/20/2017
   * @example DateTime.now().setLocale('en-gb').toLocaleString(); //=> '20/04/2017'
   * @example DateTime.now().toLocaleString(DateTime.DATE_FULL); //=> 'April 20, 2017'
   * @example DateTime.now().toLocaleString(DateTime.DATE_FULL, { locale: 'fr' }); //=> '28 août 2022'
   * @example DateTime.now().toLocaleString(DateTime.TIME_SIMPLE); //=> '11:32 AM'
   * @example DateTime.now().toLocaleString(DateTime.DATETIME_SHORT); //=> '4/20/2017, 11:32 AM'
   * @example DateTime.now().toLocaleString({ weekday: 'long', month: 'long', day: '2-digit' }); //=> 'Thursday, April 20'
   * @example DateTime.now().toLocaleString({ weekday: 'short', month: 'short', day: '2-digit', hour: '2-digit', minute: '2-digit' }); //=> 'Thu, Apr 20, 11:27 AM'
   * @example DateTime.now().toLocaleString({ hour: '2-digit', minute: '2-digit', hourCycle: 'h23' }); //=> '11:32'
   * @return {string}
   */
  toLocaleString(formatOpts = DATE_SHORT, opts = {}) {
    return this.isValid ? Formatter.create(this.loc.clone(opts), formatOpts).formatDateTime(this) : INVALID3;
  }
  /**
   * Returns an array of format "parts", meaning individual tokens along with metadata. This is allows callers to post-process individual sections of the formatted output.
   * Defaults to the system's locale if no locale has been specified
   * @see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/DateTimeFormat/formatToParts
   * @param opts {Object} - Intl.DateTimeFormat constructor options, same as `toLocaleString`.
   * @example DateTime.now().toLocaleParts(); //=> [
   *                                   //=>   { type: 'day', value: '25' },
   *                                   //=>   { type: 'literal', value: '/' },
   *                                   //=>   { type: 'month', value: '05' },
   *                                   //=>   { type: 'literal', value: '/' },
   *                                   //=>   { type: 'year', value: '1982' }
   *                                   //=> ]
   */
  toLocaleParts(opts = {}) {
    return this.isValid ? Formatter.create(this.loc.clone(opts), opts).formatDateTimeParts(this) : [];
  }
  /**
   * Returns an ISO 8601-compliant string representation of this DateTime
   * @param {Object} opts - options
   * @param {boolean} [opts.suppressMilliseconds=false] - exclude milliseconds from the format if they're 0
   * @param {boolean} [opts.suppressSeconds=false] - exclude seconds from the format if they're 0
   * @param {boolean} [opts.includeOffset=true] - include the offset, such as 'Z' or '-04:00'
   * @param {boolean} [opts.extendedZone=false] - add the time zone format extension
   * @param {string} [opts.format='extended'] - choose between the basic and extended format
   * @example DateTime.utc(1983, 5, 25).toISO() //=> '1982-05-25T00:00:00.000Z'
   * @example DateTime.now().toISO() //=> '2017-04-22T20:47:05.335-04:00'
   * @example DateTime.now().toISO({ includeOffset: false }) //=> '2017-04-22T20:47:05.335'
   * @example DateTime.now().toISO({ format: 'basic' }) //=> '20170422T204705.335-0400'
   * @return {string}
   */
  toISO({
    format = "extended",
    suppressSeconds = false,
    suppressMilliseconds = false,
    includeOffset = true,
    extendedZone = false
  } = {}) {
    if (!this.isValid) {
      return null;
    }
    const ext = format === "extended";
    let c = toISODate(this, ext);
    c += "T";
    c += toISOTime(this, ext, suppressSeconds, suppressMilliseconds, includeOffset, extendedZone);
    return c;
  }
  /**
   * Returns an ISO 8601-compliant string representation of this DateTime's date component
   * @param {Object} opts - options
   * @param {string} [opts.format='extended'] - choose between the basic and extended format
   * @example DateTime.utc(1982, 5, 25).toISODate() //=> '1982-05-25'
   * @example DateTime.utc(1982, 5, 25).toISODate({ format: 'basic' }) //=> '19820525'
   * @return {string}
   */
  toISODate({ format = "extended" } = {}) {
    if (!this.isValid) {
      return null;
    }
    return toISODate(this, format === "extended");
  }
  /**
   * Returns an ISO 8601-compliant string representation of this DateTime's week date
   * @example DateTime.utc(1982, 5, 25).toISOWeekDate() //=> '1982-W21-2'
   * @return {string}
   */
  toISOWeekDate() {
    return toTechFormat(this, "kkkk-'W'WW-c");
  }
  /**
   * Returns an ISO 8601-compliant string representation of this DateTime's time component
   * @param {Object} opts - options
   * @param {boolean} [opts.suppressMilliseconds=false] - exclude milliseconds from the format if they're 0
   * @param {boolean} [opts.suppressSeconds=false] - exclude seconds from the format if they're 0
   * @param {boolean} [opts.includeOffset=true] - include the offset, such as 'Z' or '-04:00'
   * @param {boolean} [opts.extendedZone=true] - add the time zone format extension
   * @param {boolean} [opts.includePrefix=false] - include the `T` prefix
   * @param {string} [opts.format='extended'] - choose between the basic and extended format
   * @example DateTime.utc().set({ hour: 7, minute: 34 }).toISOTime() //=> '07:34:19.361Z'
   * @example DateTime.utc().set({ hour: 7, minute: 34, seconds: 0, milliseconds: 0 }).toISOTime({ suppressSeconds: true }) //=> '07:34Z'
   * @example DateTime.utc().set({ hour: 7, minute: 34 }).toISOTime({ format: 'basic' }) //=> '073419.361Z'
   * @example DateTime.utc().set({ hour: 7, minute: 34 }).toISOTime({ includePrefix: true }) //=> 'T07:34:19.361Z'
   * @return {string}
   */
  toISOTime({
    suppressMilliseconds = false,
    suppressSeconds = false,
    includeOffset = true,
    includePrefix = false,
    extendedZone = false,
    format = "extended"
  } = {}) {
    if (!this.isValid) {
      return null;
    }
    let c = includePrefix ? "T" : "";
    return c + toISOTime(
      this,
      format === "extended",
      suppressSeconds,
      suppressMilliseconds,
      includeOffset,
      extendedZone
    );
  }
  /**
   * Returns an RFC 2822-compatible string representation of this DateTime
   * @example DateTime.utc(2014, 7, 13).toRFC2822() //=> 'Sun, 13 Jul 2014 00:00:00 +0000'
   * @example DateTime.local(2014, 7, 13).toRFC2822() //=> 'Sun, 13 Jul 2014 00:00:00 -0400'
   * @return {string}
   */
  toRFC2822() {
    return toTechFormat(this, "EEE, dd LLL yyyy HH:mm:ss ZZZ", false);
  }
  /**
   * Returns a string representation of this DateTime appropriate for use in HTTP headers. The output is always expressed in GMT.
   * Specifically, the string conforms to RFC 1123.
   * @see https://www.w3.org/Protocols/rfc2616/rfc2616-sec3.html#sec3.3.1
   * @example DateTime.utc(2014, 7, 13).toHTTP() //=> 'Sun, 13 Jul 2014 00:00:00 GMT'
   * @example DateTime.utc(2014, 7, 13, 19).toHTTP() //=> 'Sun, 13 Jul 2014 19:00:00 GMT'
   * @return {string}
   */
  toHTTP() {
    return toTechFormat(this.toUTC(), "EEE, dd LLL yyyy HH:mm:ss 'GMT'");
  }
  /**
   * Returns a string representation of this DateTime appropriate for use in SQL Date
   * @example DateTime.utc(2014, 7, 13).toSQLDate() //=> '2014-07-13'
   * @return {string}
   */
  toSQLDate() {
    if (!this.isValid) {
      return null;
    }
    return toISODate(this, true);
  }
  /**
   * Returns a string representation of this DateTime appropriate for use in SQL Time
   * @param {Object} opts - options
   * @param {boolean} [opts.includeZone=false] - include the zone, such as 'America/New_York'. Overrides includeOffset.
   * @param {boolean} [opts.includeOffset=true] - include the offset, such as 'Z' or '-04:00'
   * @param {boolean} [opts.includeOffsetSpace=true] - include the space between the time and the offset, such as '05:15:16.345 -04:00'
   * @example DateTime.utc().toSQL() //=> '05:15:16.345'
   * @example DateTime.now().toSQL() //=> '05:15:16.345 -04:00'
   * @example DateTime.now().toSQL({ includeOffset: false }) //=> '05:15:16.345'
   * @example DateTime.now().toSQL({ includeZone: false }) //=> '05:15:16.345 America/New_York'
   * @return {string}
   */
  toSQLTime({ includeOffset = true, includeZone = false, includeOffsetSpace = true } = {}) {
    let fmt = "HH:mm:ss.SSS";
    if (includeZone || includeOffset) {
      if (includeOffsetSpace) {
        fmt += " ";
      }
      if (includeZone) {
        fmt += "z";
      } else if (includeOffset) {
        fmt += "ZZ";
      }
    }
    return toTechFormat(this, fmt, true);
  }
  /**
   * Returns a string representation of this DateTime appropriate for use in SQL DateTime
   * @param {Object} opts - options
   * @param {boolean} [opts.includeZone=false] - include the zone, such as 'America/New_York'. Overrides includeOffset.
   * @param {boolean} [opts.includeOffset=true] - include the offset, such as 'Z' or '-04:00'
   * @param {boolean} [opts.includeOffsetSpace=true] - include the space between the time and the offset, such as '05:15:16.345 -04:00'
   * @example DateTime.utc(2014, 7, 13).toSQL() //=> '2014-07-13 00:00:00.000 Z'
   * @example DateTime.local(2014, 7, 13).toSQL() //=> '2014-07-13 00:00:00.000 -04:00'
   * @example DateTime.local(2014, 7, 13).toSQL({ includeOffset: false }) //=> '2014-07-13 00:00:00.000'
   * @example DateTime.local(2014, 7, 13).toSQL({ includeZone: true }) //=> '2014-07-13 00:00:00.000 America/New_York'
   * @return {string}
   */
  toSQL(opts = {}) {
    if (!this.isValid) {
      return null;
    }
    return `${this.toSQLDate()} ${this.toSQLTime(opts)}`;
  }
  /**
   * Returns a string representation of this DateTime appropriate for debugging
   * @return {string}
   */
  toString() {
    return this.isValid ? this.toISO() : INVALID3;
  }
  /**
   * Returns a string representation of this DateTime appropriate for the REPL.
   * @return {string}
   */
  [Symbol.for("nodejs.util.inspect.custom")]() {
    if (this.isValid) {
      return `DateTime { ts: ${this.toISO()}, zone: ${this.zone.name}, locale: ${this.locale} }`;
    } else {
      return `DateTime { Invalid, reason: ${this.invalidReason} }`;
    }
  }
  /**
   * Returns the epoch milliseconds of this DateTime. Alias of {@link DateTime#toMillis}
   * @return {number}
   */
  valueOf() {
    return this.toMillis();
  }
  /**
   * Returns the epoch milliseconds of this DateTime.
   * @return {number}
   */
  toMillis() {
    return this.isValid ? this.ts : NaN;
  }
  /**
   * Returns the epoch seconds of this DateTime.
   * @return {number}
   */
  toSeconds() {
    return this.isValid ? this.ts / 1e3 : NaN;
  }
  /**
   * Returns the epoch seconds (as a whole number) of this DateTime.
   * @return {number}
   */
  toUnixInteger() {
    return this.isValid ? Math.floor(this.ts / 1e3) : NaN;
  }
  /**
   * Returns an ISO 8601 representation of this DateTime appropriate for use in JSON.
   * @return {string}
   */
  toJSON() {
    return this.toISO();
  }
  /**
   * Returns a BSON serializable equivalent to this DateTime.
   * @return {Date}
   */
  toBSON() {
    return this.toJSDate();
  }
  /**
   * Returns a JavaScript object with this DateTime's year, month, day, and so on.
   * @param opts - options for generating the object
   * @param {boolean} [opts.includeConfig=false] - include configuration attributes in the output
   * @example DateTime.now().toObject() //=> { year: 2017, month: 4, day: 22, hour: 20, minute: 49, second: 42, millisecond: 268 }
   * @return {Object}
   */
  toObject(opts = {}) {
    if (!this.isValid)
      return {};
    const base = { ...this.c };
    if (opts.includeConfig) {
      base.outputCalendar = this.outputCalendar;
      base.numberingSystem = this.loc.numberingSystem;
      base.locale = this.loc.locale;
    }
    return base;
  }
  /**
   * Returns a JavaScript Date equivalent to this DateTime.
   * @return {Date}
   */
  toJSDate() {
    return new Date(this.isValid ? this.ts : NaN);
  }
  // COMPARE
  /**
   * Return the difference between two DateTimes as a Duration.
   * @param {DateTime} otherDateTime - the DateTime to compare this one to
   * @param {string|string[]} [unit=['milliseconds']] - the unit or array of units (such as 'hours' or 'days') to include in the duration.
   * @param {Object} opts - options that affect the creation of the Duration
   * @param {string} [opts.conversionAccuracy='casual'] - the conversion system to use
   * @example
   * var i1 = DateTime.fromISO('1982-05-25T09:45'),
   *     i2 = DateTime.fromISO('1983-10-14T10:30');
   * i2.diff(i1).toObject() //=> { milliseconds: 43807500000 }
   * i2.diff(i1, 'hours').toObject() //=> { hours: 12168.75 }
   * i2.diff(i1, ['months', 'days']).toObject() //=> { months: 16, days: 19.03125 }
   * i2.diff(i1, ['months', 'days', 'hours']).toObject() //=> { months: 16, days: 19, hours: 0.75 }
   * @return {Duration}
   */
  diff(otherDateTime, unit = "milliseconds", opts = {}) {
    if (!this.isValid || !otherDateTime.isValid) {
      return Duration.invalid("created by diffing an invalid DateTime");
    }
    const durOpts = { locale: this.locale, numberingSystem: this.numberingSystem, ...opts };
    const units = maybeArray(unit).map(Duration.normalizeUnit), otherIsLater = otherDateTime.valueOf() > this.valueOf(), earlier = otherIsLater ? this : otherDateTime, later = otherIsLater ? otherDateTime : this, diffed = diff_default(earlier, later, units, durOpts);
    return otherIsLater ? diffed.negate() : diffed;
  }
  /**
   * Return the difference between this DateTime and right now.
   * See {@link DateTime#diff}
   * @param {string|string[]} [unit=['milliseconds']] - the unit or units units (such as 'hours' or 'days') to include in the duration
   * @param {Object} opts - options that affect the creation of the Duration
   * @param {string} [opts.conversionAccuracy='casual'] - the conversion system to use
   * @return {Duration}
   */
  diffNow(unit = "milliseconds", opts = {}) {
    return this.diff(_DateTime.now(), unit, opts);
  }
  /**
   * Return an Interval spanning between this DateTime and another DateTime
   * @param {DateTime} otherDateTime - the other end point of the Interval
   * @return {Interval}
   */
  until(otherDateTime) {
    return this.isValid ? Interval.fromDateTimes(this, otherDateTime) : this;
  }
  /**
   * Return whether this DateTime is in the same unit of time as another DateTime.
   * Higher-order units must also be identical for this function to return `true`.
   * Note that time zones are **ignored** in this comparison, which compares the **local** calendar time. Use {@link DateTime#setZone} to convert one of the dates if needed.
   * @param {DateTime} otherDateTime - the other DateTime
   * @param {string} unit - the unit of time to check sameness on
   * @param {Object} opts - options
   * @param {boolean} [opts.useLocaleWeeks=false] - If true, use weeks based on the locale, i.e. use the locale-dependent start of the week; only the locale of this DateTime is used
   * @example DateTime.now().hasSame(otherDT, 'day'); //~> true if otherDT is in the same current calendar day
   * @return {boolean}
   */
  hasSame(otherDateTime, unit, opts) {
    if (!this.isValid)
      return false;
    const inputMs = otherDateTime.valueOf();
    const adjustedToZone = this.setZone(otherDateTime.zone, { keepLocalTime: true });
    return adjustedToZone.startOf(unit, opts) <= inputMs && inputMs <= adjustedToZone.endOf(unit, opts);
  }
  /**
   * Equality check
   * Two DateTimes are equal if and only if they represent the same millisecond, have the same zone and location, and are both valid.
   * To compare just the millisecond values, use `+dt1 === +dt2`.
   * @param {DateTime} other - the other DateTime
   * @return {boolean}
   */
  equals(other) {
    return this.isValid && other.isValid && this.valueOf() === other.valueOf() && this.zone.equals(other.zone) && this.loc.equals(other.loc);
  }
  /**
   * Returns a string representation of a this time relative to now, such as "in two days". Can only internationalize if your
   * platform supports Intl.RelativeTimeFormat. Rounds down by default.
   * @param {Object} options - options that affect the output
   * @param {DateTime} [options.base=DateTime.now()] - the DateTime to use as the basis to which this time is compared. Defaults to now.
   * @param {string} [options.style="long"] - the style of units, must be "long", "short", or "narrow"
   * @param {string|string[]} options.unit - use a specific unit or array of units; if omitted, or an array, the method will pick the best unit. Use an array or one of "years", "quarters", "months", "weeks", "days", "hours", "minutes", or "seconds"
   * @param {boolean} [options.round=true] - whether to round the numbers in the output.
   * @param {number} [options.padding=0] - padding in milliseconds. This allows you to round up the result if it fits inside the threshold. Don't use in combination with {round: false} because the decimal output will include the padding.
   * @param {string} options.locale - override the locale of this DateTime
   * @param {string} options.numberingSystem - override the numberingSystem of this DateTime. The Intl system may choose not to honor this
   * @example DateTime.now().plus({ days: 1 }).toRelative() //=> "in 1 day"
   * @example DateTime.now().setLocale("es").toRelative({ days: 1 }) //=> "dentro de 1 día"
   * @example DateTime.now().plus({ days: 1 }).toRelative({ locale: "fr" }) //=> "dans 23 heures"
   * @example DateTime.now().minus({ days: 2 }).toRelative() //=> "2 days ago"
   * @example DateTime.now().minus({ days: 2 }).toRelative({ unit: "hours" }) //=> "48 hours ago"
   * @example DateTime.now().minus({ hours: 36 }).toRelative({ round: false }) //=> "1.5 days ago"
   */
  toRelative(options = {}) {
    if (!this.isValid)
      return null;
    const base = options.base || _DateTime.fromObject({}, { zone: this.zone }), padding = options.padding ? this < base ? -options.padding : options.padding : 0;
    let units = ["years", "months", "days", "hours", "minutes", "seconds"];
    let unit = options.unit;
    if (Array.isArray(options.unit)) {
      units = options.unit;
      unit = void 0;
    }
    return diffRelative(base, this.plus(padding), {
      ...options,
      numeric: "always",
      units,
      unit
    });
  }
  /**
   * Returns a string representation of this date relative to today, such as "yesterday" or "next month".
   * Only internationalizes on platforms that supports Intl.RelativeTimeFormat.
   * @param {Object} options - options that affect the output
   * @param {DateTime} [options.base=DateTime.now()] - the DateTime to use as the basis to which this time is compared. Defaults to now.
   * @param {string} options.locale - override the locale of this DateTime
   * @param {string} options.unit - use a specific unit; if omitted, the method will pick the unit. Use one of "years", "quarters", "months", "weeks", or "days"
   * @param {string} options.numberingSystem - override the numberingSystem of this DateTime. The Intl system may choose not to honor this
   * @example DateTime.now().plus({ days: 1 }).toRelativeCalendar() //=> "tomorrow"
   * @example DateTime.now().setLocale("es").plus({ days: 1 }).toRelative() //=> ""mañana"
   * @example DateTime.now().plus({ days: 1 }).toRelativeCalendar({ locale: "fr" }) //=> "demain"
   * @example DateTime.now().minus({ days: 2 }).toRelativeCalendar() //=> "2 days ago"
   */
  toRelativeCalendar(options = {}) {
    if (!this.isValid)
      return null;
    return diffRelative(options.base || _DateTime.fromObject({}, { zone: this.zone }), this, {
      ...options,
      numeric: "auto",
      units: ["years", "months", "days"],
      calendary: true
    });
  }
  /**
   * Return the min of several date times
   * @param {...DateTime} dateTimes - the DateTimes from which to choose the minimum
   * @return {DateTime} the min DateTime, or undefined if called with no argument
   */
  static min(...dateTimes) {
    if (!dateTimes.every(_DateTime.isDateTime)) {
      throw new InvalidArgumentError("min requires all arguments be DateTimes");
    }
    return bestBy(dateTimes, (i) => i.valueOf(), Math.min);
  }
  /**
   * Return the max of several date times
   * @param {...DateTime} dateTimes - the DateTimes from which to choose the maximum
   * @return {DateTime} the max DateTime, or undefined if called with no argument
   */
  static max(...dateTimes) {
    if (!dateTimes.every(_DateTime.isDateTime)) {
      throw new InvalidArgumentError("max requires all arguments be DateTimes");
    }
    return bestBy(dateTimes, (i) => i.valueOf(), Math.max);
  }
  // MISC
  /**
   * Explain how a string would be parsed by fromFormat()
   * @param {string} text - the string to parse
   * @param {string} fmt - the format the string is expected to be in (see description)
   * @param {Object} options - options taken by fromFormat()
   * @return {Object}
   */
  static fromFormatExplain(text, fmt, options = {}) {
    const { locale = null, numberingSystem = null } = options, localeToUse = Locale.fromOpts({
      locale,
      numberingSystem,
      defaultToEN: true
    });
    return explainFromTokens(localeToUse, text, fmt);
  }
  /**
   * @deprecated use fromFormatExplain instead
   */
  static fromStringExplain(text, fmt, options = {}) {
    return _DateTime.fromFormatExplain(text, fmt, options);
  }
  // FORMAT PRESETS
  /**
   * {@link DateTime#toLocaleString} format like 10/14/1983
   * @type {Object}
   */
  static get DATE_SHORT() {
    return DATE_SHORT;
  }
  /**
   * {@link DateTime#toLocaleString} format like 'Oct 14, 1983'
   * @type {Object}
   */
  static get DATE_MED() {
    return DATE_MED;
  }
  /**
   * {@link DateTime#toLocaleString} format like 'Fri, Oct 14, 1983'
   * @type {Object}
   */
  static get DATE_MED_WITH_WEEKDAY() {
    return DATE_MED_WITH_WEEKDAY;
  }
  /**
   * {@link DateTime#toLocaleString} format like 'October 14, 1983'
   * @type {Object}
   */
  static get DATE_FULL() {
    return DATE_FULL;
  }
  /**
   * {@link DateTime#toLocaleString} format like 'Tuesday, October 14, 1983'
   * @type {Object}
   */
  static get DATE_HUGE() {
    return DATE_HUGE;
  }
  /**
   * {@link DateTime#toLocaleString} format like '09:30 AM'. Only 12-hour if the locale is.
   * @type {Object}
   */
  static get TIME_SIMPLE() {
    return TIME_SIMPLE;
  }
  /**
   * {@link DateTime#toLocaleString} format like '09:30:23 AM'. Only 12-hour if the locale is.
   * @type {Object}
   */
  static get TIME_WITH_SECONDS() {
    return TIME_WITH_SECONDS;
  }
  /**
   * {@link DateTime#toLocaleString} format like '09:30:23 AM EDT'. Only 12-hour if the locale is.
   * @type {Object}
   */
  static get TIME_WITH_SHORT_OFFSET() {
    return TIME_WITH_SHORT_OFFSET;
  }
  /**
   * {@link DateTime#toLocaleString} format like '09:30:23 AM Eastern Daylight Time'. Only 12-hour if the locale is.
   * @type {Object}
   */
  static get TIME_WITH_LONG_OFFSET() {
    return TIME_WITH_LONG_OFFSET;
  }
  /**
   * {@link DateTime#toLocaleString} format like '09:30', always 24-hour.
   * @type {Object}
   */
  static get TIME_24_SIMPLE() {
    return TIME_24_SIMPLE;
  }
  /**
   * {@link DateTime#toLocaleString} format like '09:30:23', always 24-hour.
   * @type {Object}
   */
  static get TIME_24_WITH_SECONDS() {
    return TIME_24_WITH_SECONDS;
  }
  /**
   * {@link DateTime#toLocaleString} format like '09:30:23 EDT', always 24-hour.
   * @type {Object}
   */
  static get TIME_24_WITH_SHORT_OFFSET() {
    return TIME_24_WITH_SHORT_OFFSET;
  }
  /**
   * {@link DateTime#toLocaleString} format like '09:30:23 Eastern Daylight Time', always 24-hour.
   * @type {Object}
   */
  static get TIME_24_WITH_LONG_OFFSET() {
    return TIME_24_WITH_LONG_OFFSET;
  }
  /**
   * {@link DateTime#toLocaleString} format like '10/14/1983, 9:30 AM'. Only 12-hour if the locale is.
   * @type {Object}
   */
  static get DATETIME_SHORT() {
    return DATETIME_SHORT;
  }
  /**
   * {@link DateTime#toLocaleString} format like '10/14/1983, 9:30:33 AM'. Only 12-hour if the locale is.
   * @type {Object}
   */
  static get DATETIME_SHORT_WITH_SECONDS() {
    return DATETIME_SHORT_WITH_SECONDS;
  }
  /**
   * {@link DateTime#toLocaleString} format like 'Oct 14, 1983, 9:30 AM'. Only 12-hour if the locale is.
   * @type {Object}
   */
  static get DATETIME_MED() {
    return DATETIME_MED;
  }
  /**
   * {@link DateTime#toLocaleString} format like 'Oct 14, 1983, 9:30:33 AM'. Only 12-hour if the locale is.
   * @type {Object}
   */
  static get DATETIME_MED_WITH_SECONDS() {
    return DATETIME_MED_WITH_SECONDS;
  }
  /**
   * {@link DateTime#toLocaleString} format like 'Fri, 14 Oct 1983, 9:30 AM'. Only 12-hour if the locale is.
   * @type {Object}
   */
  static get DATETIME_MED_WITH_WEEKDAY() {
    return DATETIME_MED_WITH_WEEKDAY;
  }
  /**
   * {@link DateTime#toLocaleString} format like 'October 14, 1983, 9:30 AM EDT'. Only 12-hour if the locale is.
   * @type {Object}
   */
  static get DATETIME_FULL() {
    return DATETIME_FULL;
  }
  /**
   * {@link DateTime#toLocaleString} format like 'October 14, 1983, 9:30:33 AM EDT'. Only 12-hour if the locale is.
   * @type {Object}
   */
  static get DATETIME_FULL_WITH_SECONDS() {
    return DATETIME_FULL_WITH_SECONDS;
  }
  /**
   * {@link DateTime#toLocaleString} format like 'Friday, October 14, 1983, 9:30 AM Eastern Daylight Time'. Only 12-hour if the locale is.
   * @type {Object}
   */
  static get DATETIME_HUGE() {
    return DATETIME_HUGE;
  }
  /**
   * {@link DateTime#toLocaleString} format like 'Friday, October 14, 1983, 9:30:33 AM Eastern Daylight Time'. Only 12-hour if the locale is.
   * @type {Object}
   */
  static get DATETIME_HUGE_WITH_SECONDS() {
    return DATETIME_HUGE_WITH_SECONDS;
  }
};
function friendlyDateTime(dateTimeish) {
  if (DateTime.isDateTime(dateTimeish)) {
    return dateTimeish;
  } else if (dateTimeish && dateTimeish.valueOf && isNumber(dateTimeish.valueOf())) {
    return DateTime.fromJSDate(dateTimeish);
  } else if (dateTimeish && typeof dateTimeish === "object") {
    return DateTime.fromObject(dateTimeish);
  } else {
    throw new InvalidArgumentError(
      `Unknown datetime argument: ${dateTimeish}, of type ${typeof dateTimeish}`
    );
  }
}

// src/index.js
var import_crypto2 = require("crypto");
var import_path = require("path");
var import_jstoxml = __toESM(require_jstoxml(), 1);

// src/genieAI.js
var import_crypto = __toESM(require("crypto"), 1);

// src/utils/aws.js
var import_client_s3 = require("@aws-sdk/client-s3");
var import_client_cloudfront = require("@aws-sdk/client-cloudfront");
var import_client_sqs = require("@aws-sdk/client-sqs");
var import_stream = require("stream");
var BUCKET = process.env.BUCKET ?? "genie-hub-2";
var REGION = process.env.REGION ?? "eu-west-2";
var SQS_QUEUE = process.env.SQS_QUEUE ?? "https://sqs.eu-west-2.amazonaws.com/584678469437/genie-cloud";
var s3Client = new import_client_s3.S3Client({ region: REGION });
var sqs = new import_client_sqs.SQSClient({ region: REGION });
var streamS3Object = async (key, bucket = null) => {
  try {
    const command = new import_client_s3.GetObjectCommand({
      Bucket: bucket ?? BUCKET,
      Key: key
    });
    const { Body } = await s3Client.send(command);
    if (Body instanceof import_stream.Readable) {
      return Body;
    } else {
      const stream = new import_stream.Readable();
      stream.push(await Body.transformToByteArray());
      stream.push(null);
      return stream;
    }
  } catch (err) {
    console.error(`Error streaming object ${key}:`, err);
    throw err;
  }
};
var readStream = async function* (stream) {
  for await (const chunk of stream) {
    yield chunk.toString("utf-8");
  }
};
var copyObject = async (sourceKey, destinationKey, bucket = null, ContentType = null, CacheControl = null) => {
  const args = {
    Bucket: bucket ?? BUCKET,
    CopySource: `/${bucket ?? BUCKET}/${sourceKey}`,
    Key: destinationKey,
    CacheControl,
    ContentType,
    MetadataDirective: "REPLACE"
  };
  return await s3Client.send(new import_client_s3.CopyObjectCommand(args));
};
var searchS3ByPrefix = async (prefix, suffix = null, bucket = null) => {
  try {
    let allMatches = [];
    let isTruncated = true;
    let nextContinuationToken = null;
    while (isTruncated) {
      const listParams = {
        Bucket: bucket ?? BUCKET,
        Prefix: prefix,
        ContinuationToken: nextContinuationToken
      };
      const response2 = await s3Client.send(
        new import_client_s3.ListObjectsV2Command(listParams)
      );
      let contents = response2.Contents || [];
      if (suffix) {
        contents = contents.filter((item) => item.Key.endsWith(suffix));
      }
      allMatches = allMatches.concat(contents);
      isTruncated = response2.IsTruncated;
      nextContinuationToken = response2.NextContinuationToken;
    }
    return allMatches;
  } catch (err) {
    console.error("Error in searchS3ByPrefix:", err);
    throw err;
  }
};
var listS3Folder = async (folderPath = "", justContents = true, token = null, bucket = null) => {
  try {
    let allContents = [];
    let isTruncated = true;
    let nextContinuationToken = null;
    while (isTruncated) {
      const listParams = {
        Bucket: bucket ?? BUCKET,
        Prefix: folderPath,
        ContinuationToken: nextContinuationToken
      };
      const response2 = await s3Client.send(
        new import_client_s3.ListObjectsV2Command(listParams)
      );
      allContents = allContents.concat(response2.Contents || []);
      isTruncated = response2.IsTruncated;
      nextContinuationToken = response2.NextContinuationToken;
    }
    return justContents ? allContents : { Contents: allContents };
  } catch (err) {
    console.error("Error in listS3Folder:", err);
    throw err;
  }
};
var deleteObject = async (Key, Bucket = null) => await s3Client.send(
  new import_client_s3.DeleteObjectCommand({
    Bucket: Bucket || BUCKET,
    Key
  })
);
var headObject = async (key, since = null, bucket = null) => {
  try {
    const result = await s3Client.send(
      new import_client_s3.HeadObjectCommand({
        Bucket: bucket ?? BUCKET,
        Key: key,
        IfModifiedSince: since
      })
    );
    return result;
  } catch (err) {
    if (err.name !== "NotFound") {
      console.log("Error HeadObject:", err);
    }
  }
};
var jsonFromS3 = async (key, since = null, bucket = null) => {
  bucket = bucket ?? BUCKET;
  try {
    const r = await fromS3(key, since, bucket);
    if (r) {
      return JSON.parse(r);
    }
  } catch (err) {
    console.log("Retrieve JSON: ", err);
  }
};
var fromS3 = async (key, since = null, bucket = null) => {
  bucket = bucket ?? BUCKET;
  try {
    const buffer = Buffer.concat(
      await (await s3Client.send(
        new import_client_s3.GetObjectCommand({
          Bucket: bucket,
          Key: key,
          IfModifiedSince: since
        })
      )).Body.toArray()
    );
    return buffer;
  } catch (err) {
    if (!err.Code == "NoSuchKey")
      console.log("Retrieve JSON: ", err);
  }
};
var toS3 = async (key, buffer, tags = null, mimeType = null, bucket = null, otherParams = {}) => {
  if (tags && typeof tags == "object") {
    tags = Object.keys(tags).map((key2) => `${key2}=${encodeURIComponent(tags[key2])}`).join("&");
  }
  try {
    const res = await s3Client.send(
      new import_client_s3.PutObjectCommand({
        Bucket: bucket ?? BUCKET,
        Key: key,
        Body: buffer,
        ContentType: mimeType,
        Tagging: tags,
        ...otherParams
      })
    );
    return res.ETag;
  } catch (err) {
    console.log("S3 save err", err, key, tags);
  }
};
var queueMsg = async (body, attributes) => {
  const sqsMessage = {
    QueueUrl: SQS_QUEUE,
    MessageAttributes: attributes,
    MessageBody: body
  };
  return await sqs.send(new import_client_sqs.SendMessageCommand(sqsMessage));
};

// src/utils/dates.js
var NOW = DateTime.local({ zone: "PST" });
var dateFormat = (ts, format = "y-LL-d") => DateTime.fromMillis(ts ?? NOW.toMillis()).toFormat(format);
var dateAdd = (dt, period) => {
  if (typeof dt == "string") {
    dt = DateTime.fromISO(dt);
  } else if (typeof dt == "number") {
    dt = DateTime.fromMillis(dt);
  }
  return dt.plus(period);
};
var timeAgo = (period) => dateAdd(NOW, period);

// src/utils/render-data.js
var getRenderJSON = async (params) => {
  if (typeof params != "object" || Object.keys(params).length == 0) {
    throw new Exception("Empty render param set is not supported");
  }
  const skipCache = params.skipCache ?? false;
  if (!params.offsetDate) {
    params.offsetDate = endOfLastMonth();
  }
  const warnings = [];
  const datePeriod2 = params.datePeriod * 2;
  if (params.propertyType === null || parseInt(params.propertyType) < 0) {
    const propertyTypeId = params.mlsNumber ? await listingPropertyTypeId(params) : 0;
    console.log(
      `Forced propertyType switch from ${params.propertyType} to ${propertyTypeId}.`
    );
    warnings.push({
      warning: `Forced propertyType switch from ${params.propertyType} to ${propertyTypeId}.`
    });
    params.propertyType = propertyTypeId;
  }
  let renderSettings = filteredMerge(defaultRenderSettings, params);
  if (params.downloadUrl) {
    renderSettings.downloadUrl = params.downloadUrl;
  }
  const periodFormat = "LLL `yy";
  const root = {
    // *** Output
    output: {
      _attrs: await processOutput(
        params.userId,
        params.datePeriod,
        params.renderId,
        renderSettings
      )
    },
    // *** Dates
    date: {
      _attrs: {
        period: dateAdd(params.offsetDate + MINUTE_IN_SECONDS, {
          months: -params.datePeriod
        }).toFormat(periodFormat) + " to " + DateTime.fromMillis(params.offsetDate).toFormat(
          periodFormat
        ),
        previousPeriod: dateAdd(params.offsetDate + MINUTE_IN_SECONDS, {
          months: -datePeriod2
        }).toFormat(periodFormat) + " to " + dateAdd(params.offsetDate + MINUTE_IN_SECONDS, {
          months: -params.datePeriod
        }).toFormat(periodFormat)
      }
    },
    // *** Overrides
    xslAsset: params.asset.replaceAll("/", "_"),
    // *** Overrides
    overrides: params.customizations ? processCustomizations(params.customizations) : {},
    // *** Agents
    agents: await processAgents([
      params.userId,
      ...params?.renderSettings?.additionalAgents ?? []
    ]),
    // *** Areas
    areas: params.isEmbed ? params.areaIds.map((id) => ({ id })) : await processAreas(params)
  };
  let qrUrl = params.qrCode ?? root.agents[0].agent.website ?? "";
  if (qrUrl == "skip") {
    root.output._attrs.qrUrl = "skip";
  } else if (params.customizations?.qrUrl) {
    root.output._attrs.qrUrl = params.customizations?.qrUrl;
  } else if (qrUrl && qrUrl !== "") {
    if (!qrUrl.startsWith("http"))
      qrUrl = `https://${qrUrl}`;
    const qrSVG = await generateQR(decodeURI(qrUrl));
    await toS3(
      `genie-files/${params.renderId}/qr.svg`,
      Buffer.from(qrSVG),
      null,
      "image/svg+xml"
    );
    root.output._attrs.qrUrl = `${genieGlobals.GENIE_HOST}genie-files/${params.renderId}/qr.svg`;
  }
  if (params.mlsNumber) {
    let times = [];
    if (params.openHouseTimes) {
      params.openHouseTimes.forEach((t) => {
        times.push(
          typeof t == "string" ? DateTime.fromISO(t).toMillis() : t
        );
      });
    } else {
      const r = await openhouseByMlsNumber(
        params.mlsId,
        params.mlsNumber,
        skipCache
      );
      if (r.openHouses && Array.isArray(r.openHouses)) {
        r.openHouses.forEach((t) => {
          times.push(DateTime.fromISO(t.startDateUtc).toMillis());
          times.push(DateTime.fromISO(t.endDateUtc).toMillis());
        });
      }
    }
    params.openHouseTimes = times;
    root.single = await processListing(
      params,
      root.agents[0].agent.timezone
    );
    let mlsDisplay = await mlsDisplaySettings(params.mlsId ?? 0, skipCache);
    if (mlsDisplay) {
      root.mlsDisplay = `<![CDATA[${mlsDisplay?.mlsGroupDisplaySettings?.listingPageDisclaimer ?? ""}]]>`;
    }
  }
  if (params?.collection) {
    root.collection = await processCollection(params);
  }
  return root;
};
var processOutput = async (userId, datePeriod, renderId, renderSettings) => {
  const now2 = /* @__PURE__ */ new Date();
  const offsetDate = endOfLastMonth();
  return {
    apiUrl: genieGlobals.GENIE_API,
    siteUrl: genieGlobals.GENIE_HOST,
    year: now2.getFullYear(),
    reportDate: Math.round(now2.getTime() / 1e3),
    sinceDate: dateAdd(offsetDate, { months: -datePeriod }).toSeconds(),
    renderId,
    mapboxKey: genieGlobals.MAPBOX_KEY,
    googleKey: genieGlobals.GOOGLE_KEY,
    areaIndex: 1,
    areaPeriod: datePeriod,
    userId,
    version: await buildVersion(),
    // ToDo isGenieTeam: user_params.roles.includes("genie_client_team" ),
    ...renderSettings
  };
};
var filteredMerge = (...objects) => {
  const firstObjectKeys = Object.keys(objects[0]);
  return objects.reduce((merged, obj) => {
    return Object.entries(obj).filter(([key]) => firstObjectKeys.includes(key)).reduce((result, [key, value]) => {
      result[key] = value;
      return result;
    }, merged);
  }, {});
};
var defaultRenderSettings = {
  size: "facebook",
  theme: "_default",
  themeHue: "",
  additionalAgents: null,
  propertyType: 0,
  mapStyle: "satellite-streets-v9",
  mapIcon: "dot",
  mapKey: false,
  pricePercent: "percent",
  listingStatus: "all",
  listingCount: "10",
  withBleed: false,
  withCrops: false,
  blurPrice: false,
  hideAVM: true,
  requireSignin: false,
  customerName: null,
  isLeadCapture: false,
  downloadUrl: "",
  openHouseTimes: null,
  propertyCaption: null,
  propertyCaptionSingular: null,
  reRenderUntil: null
};
var areaFromMlsNumber = async (mlsNumber, mlsId, userId, skipCache = false) => {
  const listing = await getListing(userId, mlsNumber, mlsId);
  if (listing && listing.preferredAreaId) {
    return await areaName(userId, listing.preferredAreaId, skipCache);
  }
  const areas = await propertySurroundingAreas(
    mlsNumber,
    mlsId,
    userId,
    null,
    null,
    skipCache
  );
  console.log(`Surrounding areas found:`, areas);
  if (Array.isArray(areas) && areas.length > 0) {
    let set = areas.filter(
      (area) => !["City", "CarrierRoute", "School"].includes(area.areaType)
    );
    if (set.length === 0) {
      return areas.pop();
    }
    let subset = set.filter(
      (area) => area.areaApnCount >= 1e3 && area.areaApnCount <= 3e3
    );
    if (subset.length === 0) {
      subset = set.filter((area) => area.areaType == "ZipCode");
    }
    if (subset.length > 0) {
      return subset.shift();
    } else {
      return set.shift();
    }
  }
  console.log(`No suitable area found for MLS number: ${mlsNumber}`);
  return null;
};
var agentMlsNumbers = async (userId) => {
  const r = await agentProperties(userId, false);
  return r.properties.map((p) => p.mlsNumber.toLowerCase());
};
var singleAddress = (listing) => {
  let address = `${listing.streetNumber} ${listing.streetName}`;
  if (listing.unitNumber && listing.unitNumber !== "") {
    address += ` - #${listing.unitNumber}`;
  }
  return address;
};
var setRenderDefaults = async (params) => {
  params.offsetDate = endOfLastMonth();
  params.datePeriod = params.datePeriod || params.areaPeriod || 12;
  if (params.mlsNumber && !params.mlsId) {
    params.mlsId = 0;
  }
  if (params.mlsNumber) {
    if (!params.propertyType || !params.areaId) {
      const listing = await getListing(
        params.userId,
        params.mlsNumber,
        params.mlsId
      );
      if (!params.areaId && listing.preferedAreaId) {
        params.areaId = listing.preferedAreaId;
      }
      if (!params.propertyType) {
        params.propertyType = parseInt(listing.propertyTypeID ?? 0);
      }
    }
  }
  if (params.areaId && !params.areaIds) {
    params.areaIds = [params.areaId];
  }
  if (params.mlsNumber && !params.areaId) {
    params.area = await areaFromMlsNumber(
      params.mlsNumber,
      params.mlsId,
      params.userId
    );
    if (params.area) {
      params.areaIds = [params.area.areaId];
    } else {
      throw new Error(
        // Changed from Exception to Error
        `Failed to get areaId: ${JSON.stringify(params)}`
      );
    }
  }
  params.theme = params.theme ?? "_default";
  return params;
};
var userSetting = async (userId, setting) => {
  const user = await getUser(userId);
  switch (setting) {
    case "theme":
      return user.marketingSettings.profile.defaultTheme;
  }
};
var processAgents = async (agentIds) => {
  let agents = [];
  await Promise.all(
    agentIds.map(async (agentID) => {
      const profile = await getUser(agentID);
      const marketingSettings = profile.marketingSettings;
      const findImage = (id) => {
        const image = marketingSettings.images.find(
          (img) => img.marketingImageTypeId == id
        );
        return image ? image.url : "";
      };
      const getDisclaimer = (id) => {
        const disclaimer = marketingSettings.disclaimers.find(
          (d) => d.marketingDisclaimerTypeId == id
        );
        return disclaimer ?? {
          text: "",
          url: ""
        };
      };
      const getSnippet = (id) => {
        const snippet = marketingSettings.codeSnippets.find(
          (d) => d.marketingSnippetTypeId == id
        );
        return snippet ?? {
          codeSnippet: ""
        };
      };
      let timezone, tzOffset;
      switch (marketingSettings.profile?.timeZoneId) {
        case 1:
          timezone = "America/New_York";
          break;
        case 2:
          timezone = "America/Chicago";
          break;
        case 3:
          timezone = "America/Denver";
          break;
        case 4:
          timezone = "America/Los_Angeles";
          break;
        case 5:
          timezone = "America/Anchorage";
          break;
        case 6:
          timezone = "Pacific/Honolulu";
          break;
        default:
          timezone = "America/Los_Angeles";
          break;
      }
      let about = (marketingSettings.profile.about ?? "").replaceAll(
        "\r\n",
        "&#10;"
      );
      const agent = {
        firstName: profile.firstName,
        lastName: profile.lastName,
        role: profile.roleDescription,
        photo: findImage(1),
        //"me"
        // Switching the naming IS CORRECT! Light logo used on dark themes and vice versa
        personalLogoLight: findImage(2),
        //"personal_logo_dark"
        personalLogoDark: findImage(3),
        // "personal_logo_light"
        companyLogoLight: findImage(4),
        //"company_logo_dark"
        companyLogoDark: findImage(6),
        // "company_logo_light"
        marketingName: marketingSettings.profile.displayName ?? null,
        marketingTitle: marketingSettings.profile.title ?? null,
        marketingEmail: marketingSettings.profile.email ?? null,
        marketingAbout: `<![CDATA[${about}]]>`,
        marketingLicense: marketingSettings.profile.licenseNumber ?? null,
        privacySource: getDisclaimer(1).url,
        // "privacy_source"
        privacyPolicy: getDisclaimer(1).text,
        // "privacy_text"
        disclaimerOptin: getDisclaimer(2).text,
        // "optin"
        disclaimerExtra: getDisclaimer(4).text,
        //"htmlDisclaimer"
        disclaimerIDX: getDisclaimer(3).text,
        // "idxDisclaimer"
        snippetHeadTag: getSnippet(1).codeSnippet,
        snippetOpenBodyTag: getSnippet(2).codeSnippet,
        snippetCloseBodyTag: getSnippet(3).codeSnippet,
        googleAnalyticsId: marketingSettings.hasGoogleSettings ? marketingSettings.google.analyticsId : null,
        facebookPixelId: marketingSettings.hasFacebookSettings ? marketingSettings.facebook.pixelId : null,
        pronoun: marketingSettings.profile.isTeam ? "plural" : "singular",
        timezone,
        tzOffset: DateTime.local().setZone(timezone).offset,
        mobile: marketingSettings.profile.phone ?? null,
        website: marketingSettings.profile.websiteUrl ?? null,
        email: marketingSettings.profile.email,
        agentId: agentID,
        // *** AGENT ADDRESS
        address: {
          company: marketingSettings.office.companyName ?? "",
          street: marketingSettings.office.address ?? "",
          address2: marketingSettings.office.address2 ?? "",
          city: marketingSettings.office.city ?? "",
          state: marketingSettings.office.state ?? "",
          zip: marketingSettings.office.zip ?? ""
        }
      };
      agents.push({ agent });
    })
  );
  return agents;
};
var processCustomizations = (customizations) => {
  const overrides = [];
  Object.keys(customizations).forEach((key) => {
    const content = customizations[key];
    if (typeof content == "object") {
      overrides.push({ _name: key, _content: content });
    } else if (typeof content == "string") {
      overrides.push({ _name: key, _content: content });
    }
  });
  return overrides;
};
var processAreas = async (params) => {
  const areas = [];
  await Promise.all(
    params.areaIds.map(async (areaId) => {
      const boundary = await getAreaBoundary(areaId);
      const statsData = await areaStatisticsWithPrevious(
        params.userId,
        parseInt(areaId),
        parseInt(params.datePeriod || 12)
      );
      params.isDebug && debugLog("areaStatisticsWithPrevious", params, statsData);
      const areaName2 = statsData.areaName;
      let areaImage = null;
      const area_images = [];
      area_images.forEach((image) => {
        if (!Array.isArray(image)) {
        }
        if (image.id == areaId) {
          areaImage = image.image;
        }
      });
      const defaultJSON = '{"type": "FeatureCollection","features": []}';
      let geoJSON = boundary?.mapArea?.geoJSON ?? defaultJSON;
      if (geoJSON.length > 2e5) {
        geoJSON = defaultJSON;
      }
      const area = {
        _name: "area",
        _content: [
          { id: areaId },
          { name: areaName2 ?? params?.area?.name ?? "NOT SET" },
          { geojson: `<![CDATA[${geoJSON}]]>` },
          { centerLat: boundary?.mapArea?.centerLatitude ?? 32.71 },
          {
            centerLng: boundary?.mapArea?.centerLongitude ?? -117.16
          },
          { image: areaImage ?? "" }
        ]
      };
      if (statsData.statistics) {
        let propertyTypeData, prevData;
        statsData.statistics.propertyTypeData.forEach((pData) => {
          if (pData.type == (params.propertyType ?? 0)) {
            propertyTypeData = pData.statistics;
            prevData = propertyTypeData.previousPeriod;
          }
        });
        const mls_properties = await mlsProperties(
          params.mlsId ?? 0,
          areaId,
          NOW.plus({ months: params.datePeriod * -1 }).toISO()
        );
        params.isDebug && debugLog("mlsProperties", params, mls_properties);
        if (mls_properties && Array.isArray(mls_properties)) {
          const agentListings = await agentMlsNumbers(params.userId);
          const listings = [];
          mls_properties.forEach((p) => {
            if (p.propertyTypeID == (params.propertyType ?? params.propertyTypeID ?? 0)) {
              const state = parseInt(p.statusTypeID) == 4 || parseInt(p.statusTypeID) == 12 || parseInt(p.statusTypeID) == 3 ? "pending" : p.statusType.toLowerCase();
              listings.push({
                _name: "listing",
                _attrs: {
                  lat: p.latitude,
                  lon: p.longitude,
                  // TODO: Lookup based on statusTypeID rather than the string
                  /*
                  Use values:
                  1    Active
                  2    Sold
                  3    Pending
                  4    Contingent - Pending
                  12    Active With Contingency - Pending
                  13    Expired - DON@T INCLUDE */
                  state,
                  address: singleAddress(p),
                  beds: p.bedrooms,
                  baths: p.bathroomsTotal,
                  size: p.sqft,
                  listPrice: p.priceHigh,
                  salePrice: p.salePrice ?? null,
                  listedDate: DateTime.fromISO(
                    p.listDate
                  ).toSeconds(),
                  soldDate: p.soldDate ? DateTime.fromISO(
                    p.soldDate
                  ).toSeconds() : null,
                  dom: p.daysOnMarket,
                  thumb: p.photoPrimaryUrl,
                  isAgent: agentListings.includes(
                    p.mlsNumber.toLowerCase()
                  ) ? 1 : 0,
                  sortDate: p.soldDate ? DateTime.fromISO(
                    p.soldDate
                  ).toSeconds() : DateTime.fromISO(
                    p.listDate
                  ).toSeconds()
                }
              });
            }
          });
          area._content.push({
            _name: "listings",
            _content: listings
          });
          const statistics = [
            {
              _name: "previous",
              _attrs: {
                totalSold: prevData?.sold,
                turnOver: prevData?.turnOver,
                avgPricePerSqFtSold: prevData?.avgPricePerSqFt,
                avgPricePerSqFtList: prevData?.avgSoldListingsListPricePerSqFt,
                averageListPriceForSold: prevData?.avgListPriceForSold,
                averageSalePrice: prevData?.avgSalePrice,
                averageDaysOnMarket: prevData?.avgDaysOnMarket,
                medianSalePrice: prevData?.medSalePrice,
                maxSalePrice: prevData?.maxSale?.salePrice,
                minSalePrice: prevData?.minSale?.salePrice
              }
            }
          ];
          const byBedroom = { _name: "byBedroom", _content: [] };
          propertyTypeData.bedroomStats.forEach((stat) => {
            byBedroom._content.push({
              _name: "bedroom",
              _attrs: {
                number: stat.beds,
                sold: stat.sold,
                active: stat.active,
                pending: stat.pending,
                averageSalePrice: stat.avgSalePrice,
                averageListPrice: stat.avgListPrice,
                averageListPriceForSold: stat.avgListPriceForSold
              }
            });
          });
          statistics.push(byBedroom);
          const bySize = { _name: "bySize", _content: [] };
          propertyTypeData.squareFootStats.forEach((stat) => {
            bySize._content.push({
              _name: "size",
              _attrs: {
                min: stat.min,
                max: stat.max,
                sold: stat.sold,
                active: stat.active,
                pending: stat.pending,
                averageSalePrice: stat.avgSalePrice,
                averageListPrice: stat.avgListPrice,
                averageListPriceForSold: stat.avgListPriceForSold
              }
            });
          });
          statistics.push(bySize);
          const monthly = await areaStatisticsMonthly(
            params.userId,
            areaId,
            Math.ceil(params.datePeriod / 12)
          );
          if (monthly.statistics) {
            const history = { _name: "history", _content: [] };
            monthly.statistics.slice((params.datePeriod + 1) * 2 * -1).forEach((m) => {
              if (m.propertyTypeId == params.propertyType) {
                history._content.push({
                  _name: "period",
                  _attrs: {
                    period: `${m.yearPart.toString()}${m.monthPart.toString().padStart(2, "0")}`,
                    periodName: DateTime.fromObject({
                      year: m.yearPart,
                      month: m.monthPart,
                      day: 1
                    }).toFormat("LLL yyyy"),
                    totalSold: m.soldCount,
                    averageListPrice: m.averageListPrice,
                    averageSalePrice: m.averageSalePrice,
                    averageDaysOnMarket: m.averageDaysOnMarket,
                    averagePricePerSqFt: m.averagePricePerSqFt
                  }
                });
              }
            });
            statistics.push(history);
          }
          area._content.push({
            _name: "statistics",
            _attrs: {
              lookbackMonths: params.datePeriod,
              propertyType: params.propertyType,
              averageDaysOnMarket: propertyTypeData?.avgDOM ?? 0,
              averageListPrice: propertyTypeData?.avgListPrice ?? 0,
              averageSalePrice: propertyTypeData?.avgSalePrice ?? 0,
              medianSalePrice: propertyTypeData?.medSalePrice ?? 0,
              activePropertyTypeCount: propertyTypeData?.active ?? 0,
              averageListPriceForSold: propertyTypeData?.avgListPriceForSold ?? 0,
              avgPricePerSqFtSold: propertyTypeData?.avgPricePerSqFt ?? 0,
              avgPricePerSqFtList: propertyTypeData?.avgSoldListingsListPricePerSqFt ?? 0,
              soldPropertyTypeCount: propertyTypeData?.sold ?? 0,
              taxrollCount: propertyTypeData?.taxroll ?? 0,
              turnOver: propertyTypeData?.turnOver ?? 0,
              maxSalePrice: propertyTypeData?.maxSale?.salePrice ?? 0,
              minSalePrice: propertyTypeData?.minSale?.salePrice ?? 0,
              marketTotalSoldVolume: propertyTypeData?.marketTotalSoldVolume ?? 0,
              averageYearsInHome: propertyTypeData?.avgYearsInHome ?? 0,
              ownerOccupancy: propertyTypeData?.ownerOccupancy ?? 0
            },
            _content: statistics
          });
        }
      }
      areas.push(area);
    })
  );
  return areas;
};
var listingPropertyTypeId = async (params) => {
  const listing = await getListing(
    params.userId,
    params.mlsNumber,
    params.mlsId
  );
  return listing.propertyTypeID;
};
var processListing = async (params, agentTimezone) => {
  let single = [];
  const listing = await getListing(
    params.userId,
    params.mlsNumber,
    params.mlsId
  );
  params.isDebug && debugLog("getListing", params, listing);
  if (listing) {
    let primaryPhoto = null;
    let listingBoundary = null;
    if (listing.photoPrimary && listing.photoPrimary !== "") {
      primaryPhoto = listing.photoPrimary;
    } else if (listing.listingPhotos && listing.listingPhotos.length > 0) {
      primaryPhoto = listing.listingPhotos[0];
    } else {
    }
    if (listing.virtualTourUrl) {
      listing.virtualTourUrl = listing.virtualTourUrl.replaceAll(
        "http:",
        "https:"
      );
      if (listing.virtualTourUrl.indexOf("youtube.com/watch")) {
        listing.virtualTourUrl = listing.virtualTourUrl.replace(
          /https:\/\/www\.youtube\.com\/watch\?v=([a-zA-Z0-9_-]+)/,
          "https://www.youtube.com/embed/$1"
        );
      }
    }
    single = [
      { mlsNumber: listing.mlsNumber ?? "" },
      { mlsId: listing.mlsID ?? "" },
      { price: listing.lowPrice ?? 0 },
      { highPrice: listing.highPrice ?? "" },
      { salePrice: listing.salePrice ?? "" },
      { listed: listing.listedOn ?? Date.now() / 1e3 },
      { soldDate: listing.soldDate ?? "" },
      { daysOnMarket: listing.daysOnMarket ?? "" },
      { type: listing.propertyType },
      { listingStatus: listing.listingStatus ?? "" },
      { listingAgent: listing.listingAgentName ?? "" },
      { statusTypeID: listing.statusTypeID ?? "" },
      { description: listing.remarks ?? "" },
      //ToDo clean entities?
      { photoPrimary: primaryPhoto },
      { listingBoundary: listingBoundary ?? "" },
      { squareFeet: listing.squareFeet ?? "Enquire" },
      { lotSize: listing.lotSize ?? "Enquire" },
      { acres: listing.acres ?? "Enquire" },
      { built: listing.yearBuilt ?? "Enquire" },
      { virtualTourUrl: listing.virtualTourUrl },
      { latitude: listing.latitude ?? 0 },
      { longitude: listing.longitude ?? 0 },
      { city: listing.city ?? "" }
    ];
    const listingAgentContent = [];
    listingAgentContent.push({
      _name: "listingAgent",
      _attrs: {
        count: 1,
        name: listing.listingAgentName ?? "",
        email: listing.listingAgentEmail ?? "",
        phone: listing.listingAgentPhone ?? "",
        license: listing.listingAgentStateLicense ?? "",
        broker: listing.listingBrokerName ?? ""
      }
    });
    if (listing.coListingAgentName !== "" || listing.coListingBrokerName !== "") {
      listingAgentContent.push({
        _name: "listingAgent",
        _attrs: {
          count: 2,
          name: listing.coListingAgentName ?? "",
          email: listing.coListingAgentEmail ?? "",
          phone: listing.coListingAgentPhone ?? "",
          license: listing.coListingAgentStateLicense ?? "",
          broker: listing.coListingBrokerName ?? ""
        }
      });
    }
    single.push({
      _name: "listingAgents",
      _content: listingAgentContent
    });
    if (params.openHouseTimes) {
      const tz = { zone: agentTimezone ?? "PST" };
      const oh = {
        _name: "openHouse",
        _content: []
      };
      const timeAttrbs = {
        dow: "EEEE",
        date: "d",
        month: "MMMM",
        year: "y"
      };
      for (let i = 0; i < params.openHouseTimes.length; i += 2) {
        const ts1 = params.openHouseTimes[i];
        const ts2 = params.openHouseTimes[i + 1];
        if (ts2 > NOW && ts1 < timeAgo({ days: 7 })) {
          let session = { _name: "session", _attrs: {} };
          Object.keys(timeAttrbs).forEach(
            (key) => session._attrs[key] = DateTime.fromMillis(
              ts1,
              tz
            ).toFormat(timeAttrbs[key])
          );
          [
            { name: "starts", value: ts1 },
            { name: "ends", value: ts2 }
          ].forEach((o) => {
            const dt = DateTime.fromMillis(o.value, tz);
            const dtFormat = dt.minute === 0 ? "ha" : "t";
            session._attrs[o.name] = dt.toFormat(dtFormat);
          });
          session._attrs["ms"] = ts1;
          oh._content.push(session);
        }
      }
      single.push(oh);
    }
    single.push({
      _name: "bedrooms",
      _attrs: { count: listing?.bedrooms || "n/a" }
    });
    single.push({
      _name: "bathrooms",
      _attrs: {
        total: listing.totalBathrooms,
        full: listing.bathroomsFull,
        half: listing.bathroomsHalf
      }
    });
    single.push({
      _name: "parking",
      _attrs: {
        spaces: listing.parkingSpaces,
        garage: listing.garageSpaces
      }
    });
    single.push({
      _name: "address",
      _content: [
        { streetNumber: listing.streetNumber ?? "" },
        { unitNumber: listing.unitNumber ?? "" },
        { street: listing.listingAddress ?? "" },
        { city: listing.city ?? "" },
        { state: listing.state ?? "" },
        { zip: listing.zip ?? "" },
        {
          streetName: listing.streetName ?? listing.listingAddress ?? ""
        }
      ]
    });
    const dimensions = [];
    listing?.roomDimensions.forEach(
      (d) => dimensions.push({
        _name: "room",
        _attrs: {
          name: d.key,
          size: d.value
        }
      })
    );
    dimensions.length && single.push({ _name: "dimensions", _content: dimensions });
    const features = [];
    listing?.features.forEach(
      (f) => features.push({
        _name: "feature",
        _attrs: {
          category: f.key,
          description: f.value
        }
      })
    );
    features.length && single.push({ _name: "features", _content: features });
    const images = [];
    listing?.listingPhotos.forEach((src) => {
      if (src.substring(0, 2) == "//") {
        src = `https:${src}`;
      }
      images.push({
        _name: "image",
        _attrs: { src }
      });
    });
    images.length && single.push({ _name: "images", _content: images });
  }
  return single;
};
var processCollection = async (params) => {
  const collectionData = await jsonFromS3(
    `genie-tools/collections/${params.collection}.json`
  );
  if (collectionData) {
    const collection = {
      _attrs: {
        id: params.renderId,
        name: collectionData.name,
        template: collectionData.template,
        assembled: Math.round(Date.now() / 1e3)
      }
    };
    const sections = [];
    await Promise.all(
      Object.keys(collectionData.sections).map(async (key, i) => {
        const sectionData = collectionData.sections[key];
        const meta = sectionData.meta ?? {};
        const caption = meta.caption ?? "";
        const description = meta.description ?? "";
        const section = {
          _name: "section",
          _attrs: {
            name: sectionData.name || `Section ${i + 1}`,
            caption,
            description,
            sort: parseInt(sectionData?.sort ?? 1)
          },
          _content: []
        };
        await Promise.all(
          sectionData.assets.map(async (asset) => {
            if (!asset.hide) {
              const assetData = await assetSetting(
                asset.asset,
                "all"
              );
              if (Object.keys(assetData).length > 0) {
                const size = asset.size ?? (Array.isArray(assetData?.sizes) && assetData.sizes[0]) ?? DEFAULT_SIZE;
                let qrUrl = asset.qrDestination ?? null;
                const { s3Key } = await getS3Key(asset.asset, {
                  ...params,
                  lpo: asset.lpo
                });
                const tags = Array.isArray(assetData?.tags) ? assetData?.tags?.map((tag) => ({
                  _name: "tag",
                  _attrs: { name: tag.trim() }
                })) : null;
                const _attrs = {
                  stylesheet: asset.asset,
                  size,
                  sort: parseInt(asset.sort),
                  name: asset.name ?? asset.knownAs ?? assetData.name,
                  version: assetData.version ?? 1,
                  renderKey: s3Key,
                  qrUrl
                };
                if (assetData.pages?.length) {
                  _attrs.pageCount = assetData.pages.length;
                }
                section._content.push({
                  _name: "asset",
                  _attrs,
                  _content: tags
                });
              }
            }
          })
        );
        sections.push(section);
      })
    );
    collection.sections = sections;
    if (params.collection.docs) {
      const docs_el = [];
      params.collection.docs.forEach((docFolder, index) => {
        const folder = {
          _name: "folder",
          _attrs: {
            name: index
          },
          _content: []
        };
        docFolder.forEach((doc) => {
          folder._content.push({
            _name: "doc",
            _attrs: {
              name: doc.name,
              link: doc.url
            },
            _content: [
              {
                _name: "image",
                _attrs: {
                  src: () => {
                    switch (doc.type) {
                      case "xls":
                      case "xlsx":
                        return "{$pluginUrl}assets/listing-commands/img/icon-xls.png";
                      case "pdf":
                        return "{$pluginUrl}assets/listing-commands/img/icon-pdf.png";
                      case "doc":
                      case "docx":
                        return "{$pluginUrl}assets/listing-commands/img/icon-doc.png";
                      default:
                        return "{$pluginUrl}assets/listing-commands/img/icon-file.png";
                    }
                  },
                  class: "icon"
                }
              }
            ]
          });
        });
        docs_el.push(folder);
      });
      collection.push({ _name: "additionalDocs", _content: docs_el });
    }
    if (params.areaIds.length) {
    }
    return collection;
  }
};
var buildVersion = async () => (await listS3Folder("_assets/landing-pages/dist")).pop().Key.replace("_assets/landing-pages/dist/", "").split("/").shift();
var debugLog = async (source, params, data) => {
  console.log("debugLog", source, params, data);
};
var preCallGenieAPIs = async (params) => {
  try {
    if (params.mlsNumber) {
      await openhouseByMlsNumber(params.mlsId, params.mlsNumber);
      await propertySurroundingAreas(
        params.mlsNumber,
        params.mlsId,
        params.userId
      );
      await agentProperties(params.userId, false);
      await areaFromMlsNumber(
        params.mlsNumber,
        params.mlsId,
        params.userId
      );
      await getListing(params.userId, params.mlsNumber, params.mlsId);
    }
    if (Array.isArray(params?.agentIds)) {
      await Promise.all(
        params.agentIds.map(async (agentId) => await getUser(agentId))
      );
    }
    if (Array.isArray(params?.areaIds)) {
      await Promise.all(
        params.areaIds.map(async (areaId) => {
          await getAreaBoundary(areaId);
          await areaStatisticsWithPrevious(
            params.userId,
            areaId,
            parseInt(params.datePeriod || 12)
          );
          await mlsProperties(
            params.mlsId ?? 0,
            areaId,
            NOW.plus({ months: params.datePeriod * -1 }).toISO()
          );
          await agentMlsNumbers(params.userId);
          await areaStatisticsMonthly(
            params.userId,
            areaId,
            Math.ceil(params.datePeriod / 12)
          );
        })
      );
    }
    return true;
  } catch (err) {
    console.log("precache error", err);
    return false;
  }
};

// src/utils/cloudHubAPI.js
var import_qrcode_svg = __toESM(require_qrcode(), 1);
var cloudHubAPI = async (route, params) => {
  let result = { none: true, route, params: { ...params } };
  switch (route) {
    case "get-agent":
      const agent = await getUser(params.agentId);
      result = { success: true, agent };
      break;
    case "recent-renders":
      const renders = await listS3Folder("_lookup/renders");
      const reRenders = await listS3Folder("_lookup/re-render");
      const restructure = (arr) => arr.reduce((acc, { Key, LastModified }) => {
        const renderId = Key.split("/").pop();
        acc[renderId] = LastModified;
        return acc;
      }, {});
      result = {
        success: true,
        renders: restructure(renders),
        reRenders: restructure(reRenders)
      };
      break;
    case "get-assets":
      const assets = await getAssets();
      result = { success: true, ...assets };
      break;
    case "get-themes":
      const themes = await getThemes();
      result = { success: true, ...themes };
      break;
    case "get-collection-templates":
      const templates = await getCollectionTemplates();
      result = { success: true, ...templates };
      break;
    case "get-collections":
      const collections = await getCollections();
      const processedCollections = {};
      for (const index in collections) {
        if (collections[index].Key.endsWith("json")) {
          processedCollections[basename(collections[index].Key)] = JSON.parse(
            (await fromS3(collections[index].Key)).toString()
          );
        }
      }
      result = {
        success: true,
        collections: processedCollections
      };
      break;
    case "save-collection":
      const collectionSaved = await saveCollection(params);
      response.body = {
        success: true,
        collection: collectionSaved
      };
      break;
    case "render-errors":
      const errors = [];
      const rErrors = await listS3Folder("_errors");
      await Promise.all(
        rErrors.map(async (e) => {
          if (!params.renderId || e.Key.includes(params.renderId)) {
            if (e.Size > 0) {
              const json = JSON.parse(
                (await fromS3(e.Key)).toString()
              );
              json.key = e.Key;
              errors.push(json);
            }
          }
        })
      );
      response.body = { success: true, ...errors };
      break;
  }
  return result;
};
var getThemes = async () => {
  let themes = {};
  const r = await listS3Folder("_assets/themes");
  await Promise.all(
    r.map(async (t) => {
      if (t.Size > 0) {
        const css = await fromS3(t.Key);
        const data = getFileData(css, { name: "Theme Name" });
        const slug = t.Key.replace(".css", "").replace(
          "_assets/themes/",
          ""
        );
        themes[slug] = data;
      }
    })
  );
  return { themes };
};
var getAssets = async () => {
  let assets = {};
  const r = await listS3Folder("_assets/_xsl");
  await Promise.all(
    r.map(async (t) => {
      if (t.Size > 0) {
        const xsl = await fromS3(t.Key);
        const data = getFileData(xsl, genieGlobals.ASSET_HEADERS);
        const slug = t.Key.replace(".xsl", "").replace(
          "_assets/_xsl/",
          ""
        );
        assets[slug] = data;
      }
    })
  );
  return { assets };
};
var getCollectionTemplates = async () => {
  const templates = await listS3Folder("assets/_xsl/collections");
  return { templates };
};
var getCollections = async () => await listS3Folder("genie-tools/collections");
var saveCollection = async (data) => {
  await toS3(
    `genie-tools/collections/${data.template}.json`,
    Buffer.from(JSON.stringify(data.collection))
  );
  return true;
};
var generateQR = async (url) => new import_qrcode_svg.default(url).svg();

// src/utils/embedsAPI.js
var embedsAPI = async (route, params) => {
  let result = {};
  try {
    switch (route) {
      case "get-landing-data":
        result = await getLandingPageData(params);
        break;
      case "add-lead":
        result = await add_lead(params);
        break;
      case "update-lead":
        result = await update_lead(params);
        break;
      case "address-search":
        result = await address_search(params);
        break;
      case "get-agent-data":
        result = await get_agent_data(params);
        break;
      case "get-area-data":
        result = await get_area_data(params);
        break;
      case "get-area-monthly":
        result = await get_area_monthly(params);
        break;
      case "get-area-properties":
        result = await get_area_properties(params);
        break;
      case "get-area-polygon":
        result = await get_area_polygon(params);
        break;
      case "get-listing-data":
        result = await get_listing_details(params);
        break;
      case "get-qr-property":
        result = await get_qr_property(params);
        break;
      case "get-short-data":
        result = await get_short_data(params);
        break;
      case "get-property":
        result = await get_property(params);
        break;
      case "get-mls-display":
        result = await get_mls_display(params);
        break;
      default:
        throw new Error(`Unknown route: ${route}`);
    }
    if (result) {
      result.route = `Embed: ${route}`;
    } else {
      result = { route: `Embed: ${route}`, error: "No result returned" };
    }
  } catch (error2) {
    console.error(`Error in embedsAPI for route ${route}:`, error2);
    result = { route: `Embed: ${route}`, error: error2.message };
  }
  return result;
};
var getLandingPageData = async (params) => {
  let { propertyId, qrId, shortUrlDataId, token, agentId, hideAVM } = {
    ...params
  };
  let property = null, lead = null;
  if (token) {
    if (typeof qrId !== "undefined") {
      property = await getQRProperty(qrId, token);
      lead = {
        genieLeadId: property.genieLeadId,
        salutation: property.ownerDisplayName
      };
    } else if (typeof shortUrlDataId !== "undefined") {
      lead = await getShortData(parseInt(shortUrlDataId), token, agentId, params.skipLeadCreate);
      if (!propertyId) {
        propertyId = lead.propertyId;
      }
    }
  }
  if (propertyId && !property) {
    property = await getPropertyFromId(propertyId, agentId);
  }
  if (property) {
    let data = {
      lead,
      id: property.propertyID,
      firstName: property.firstName,
      lastName: property.lastName,
      emailAddress: property.emailAddress,
      ownerDisplayName: property.ownerDisplayName,
      latitude: property.latitude,
      longitude: property.longitude,
      boundaryJSON: property.boundary.geoJSON,
      address: property.siteAddress,
      city: property.siteAddressCity,
      state: property.siteAddressState,
      zip: property.siteAddressZip,
      bedrooms: property.bedrooms,
      bathrooms: property.bathrooms,
      sqFt: property.sumBuildingSqFt.toLocaleString("en-US"),
      yearBuilt: property.yearBuilt,
      currentAVM: property.firstAmericanCurrentAVM,
      avmLow: property.avmLow,
      avmHigh: property.avmHigh
    };
    if (!hideAVM || hideAVM == false || hideAVM == 0) {
      if (data.currentAVM && data.currentAVM !== "") {
        data.avm = data.currentAVM;
        delete data.currentAVM;
      } else if (!data.avmLow || data.avmLow !== "") {
        data.avm = data.avmLow;
      } else if (!data.avmHigh || data.avmHigh !== "") {
        data.avm = data.avmHigh;
      } else {
        data.avm = `${data.avmLow} - ${data.avmHigh}`;
      }
    }
    return data;
  }
};
var get_property = async (params) => {
  var agent_id = params.agentID || params.agent || params.agent_id || null;
  if (agent_id) {
    var property = genie_get_property_from_id(params.property_id, agent_id);
    if (property) {
      return success({ property });
    }
  }
  return error(["No property found"]);
};
var get_short_data = async (params) => {
  const r = await getShortData(
    parseInt(params.shortId),
    params.token,
    params.agentId || null
  );
  return r ? success({ property: r }) : error("No short data found");
};
var get_qr_property = async (params) => {
  var property = genie_get_qr_property(params.qrID, params.token);
  return property ? success({ property }) : error("No QR property found");
};
var add_lead = async (params) => {
  const agentId = params.agentId || params.agent || null;
  if (agentId) {
    var args = {};
    var keys = [
      "genieTags",
      "firstName",
      "lastName",
      "phoneNumber",
      "email",
      "emailAddress",
      "phoneNumber",
      "phone",
      "referringUrl",
      "note",
      "areaId",
      "propertyId",
      "leadInquiryType",
      "trackingData"
    ];
    let argsKey;
    for (var i = 0; i < keys.length; i++) {
      var key = keys[i];
      if (params.hasOwnProperty(key)) {
        var value = null;
        switch (key) {
          case "genieTags":
            argsKey = "tags";
            value = params[key].split(",");
            break;
          case "email":
            argsKey = "emailAddress";
            break;
          case "phone":
            argsKey = "phoneNumber";
            break;
          default:
            argsKey = key;
            break;
        }
        args[argsKey] = value !== null ? value : params[key];
      }
    }
    if (params.hasOwnProperty("fullName") && params.fullName) {
      var split = params?.fullName?.split(" ")?.filter(Boolean);
      if (split && split.length > 1) {
        var last = split.pop();
        args["lastName"] = last;
        args["firstName"] = split.join(" ");
      } else {
        args["firstName"] = params.fullName;
      }
    }
    if (params.hasOwnProperty("meta[message]") && params.hasOwnProperty("meta[message]") != null) {
      args["note"] = "Message: " + params?.meta["message"];
      delete params.meta["message"];
    } else {
      args["note"] = args["note"] || "";
    }
    var meta_keys = Object.keys(params).reduce(function(m, str) {
      if (str && str.match(/meta\[(.*)\]/)) {
        m.push(str.match(/meta\[(.*)\]/)[1]);
      }
      return m;
    }, []);
    if (meta_keys) {
      for (var j = 0; j < meta_keys.length; j++) {
        var key = meta_keys[j];
        if (!args.note)
          args.note = "";
        args["note"] += `
${key}: ${params[`meta[${key}]`]}`;
      }
    }
    if (Object.keys(args).length > 0) {
      const lead = await createLead(agentId, args);
      return success(lead);
    } else {
      return error("No lead arguments");
    }
  } else {
    return error("Missing agent ID");
  }
};
var update_lead = async (params) => {
  var agentId = params.agentId || params.agentID || params.agent || null;
  if (agentId) {
    let args = {};
    let keys = [
      "genieLeadId",
      "email",
      "phone",
      "note",
      "emailAddress",
      "phoneNumber",
      "genieTags"
    ];
    for (let i = 0; i < keys.length; i++) {
      const key = keys[i];
      if (params.hasOwnProperty(key)) {
        let value = null, argsKey = null;
        switch (key) {
          case "genieTags":
            argsKey = "tags";
            value = params[key].split(",");
            break;
          case "emailAddress":
            argsKey = "emailAddress";
            break;
          case "phoneNumber":
            argsKey = "phone";
            break;
          default:
            argsKey = key;
            break;
        }
        args[argsKey] = value !== null ? value : params[key];
      }
    }
    if (Object.keys(args).length > 0) {
      return success(await updateLead(agentId, args));
    } else {
      return error("No lead arguments");
    }
  } else {
    return error("Missing agent ID");
  }
};
var address_search = async (params) => {
  const r = await getAssessorPropertiesDetail("1|" + params.place_id);
  return success({ properties: r["properties"] });
};
var get_agent_data = async (params) => {
  const profile = await getUser(params.agentId ?? params.agent_id);
  delete profile.aspNetUserId;
  delete profile.organizationId;
  delete profile.roleId;
  delete profile.intercom;
  delete profile.facebookProfile;
  delete profile.twilioBotProfile;
  delete profile.socialProfiles;
  delete profile.codeSnippets;
  delete profile.slackChannel;
  delete profile.google;
  delete profile.hasProfile;
  delete profile.hasImages;
  delete profile.hasOffice;
  delete profile.hasDisclaimers;
  delete profile.hasSocialProfiles;
  delete profile.hasCodeSnippets;
  delete profile.hasSlackChannel;
  delete profile.hasGoogleSettings;
  delete profile.thresholds;
  delete profile.whmcsId;
  if (!params.isDebug) {
    delete profile.isActive;
    delete profile.permissions;
    delete profile.mlsProfiles;
  }
  return success({ agent: profile });
};
var get_listing_details = async (params) => {
  var result = await genie_mls_get_by_number(params.mlsid, params.slug);
  {
  }
  if (!result.photoPrimary || result.photoPrimary === "") {
    result.boundary = genie_property_boundary(
      params.id,
      params.slug,
      null,
      null
    );
  }
  return success({ listing: result });
};
var get_mls_display = async (params) => {
  return success(genie_mls_display_settings(parseInt(params.id)));
};
var get_area_properties = async (params) => {
  const profile = await getUser(params.agentId);
  const mlsGroupId = profile.mlsGroupId ?? 0;
  const r = await mlsProperties(
    mlsGroupId,
    params.areaId,
    new Date(
      Date.now() - parseInt(params.areaPeriod ?? 12) * 30 * 24 * 60 * 60 * 1e3
    ).toISOString(),
    false
  );
  const properties = r.map((p) => {
    const {
      listingAgentName,
      listingBrokerName,
      lotSqft,
      saleAgent,
      apn,
      acres,
      yearBuilt,
      saleType,
      propertyType,
      bathroomsFull,
      bathroomsHalf,
      mlsID,
      state,
      city,
      ...remainder
    } = p;
    return remainder;
  });
  return Array.isArray(properties) ? success(properties) : error({ noProps: true });
};
var get_area_monthly = async (params) => {
  let statistics = await areaStatisticsMonthly(
    params.agentId,
    parseInt(params.areaId),
    Math.ceil((params.areaPeriod ?? 12) / 12)
  );
  const areaNameResult = await areaName(params.agentId, parseInt(params.areaId));
  if (statistics.success && areaNameResult.areaName !== statistics.areaName) {
    statistics = { ...statistics, areaName: areaNameResult.areaName };
  }
  return statistics.success ? success(statistics) : error(statistics);
};
var get_area_data = async (params) => {
  let statistics = await areaStatisticsWithPrevious(
    params.agentId,
    parseInt(params.areaId),
    parseInt(params.areaPeriod || 12)
  );
  const areaNameResult = await areaName(params.agentId, parseInt(params.areaId));
  if (areaNameResult.areaName !== statistics.areaName) {
    statistics = { ...statistics, areaName: areaNameResult.areaName };
  }
  return statistics.success ? success(statistics) : error(statistics);
};
var get_area_polygon = async (params) => {
  const r = await getAreaBoundary(params.areaId);
  if (r?.success === true) {
    return success({
      polygon: r.mapArea
    });
  }
  return error("getAreaBoundary failed");
};
var error = (msg) => ({ success: false, error: msg });
var success = async (params) => ({ success: true, result: params });

// src/utils/index.js
var genieGlobals = {
  DEFAULT_SIZE: "Facebook Post",
  GOOGLE_KEY: process.env.GOOGLE_KEY ?? "AIzaSyDLFcQk1FV7U4tf_aXU3NiLItNxy_b0AzU",
  MAPBOX_KEY: process.env.MAPBOX_KEY ?? "pk.eyJ1IjoiMXBhcmtwbGFjZSIsImEiOiJjbHZxc2R6NDMwZncxMmlxaW41MzVrdzV2In0.fl0G_yHPzEc_rzAaJ58v6Q",
  GENIE_HOST: process.env.GENIE_HOST ?? "https://genie-hub-2.s3.eu-west-2.amazonaws.com/",
  GENIE_NO_CACHE_HOST: process.env.GENIE_NO_CACHE_HOST ?? "https://genie-cloud.s3.us-west-1.amazonaws.com/",
  GENIE_API: process.env.GENIE_API ?? "https://dqohcd54xpkdwnueu2wn2nkxge0aboae.lambda-url.eu-west-2.on.aws/",
  ASSET_HEADERS: {
    name: "Asset Name",
    knownAs: "Known As",
    thumbnail: "Thumbnail",
    access: "Access",
    permission: "Permission",
    approved: "Approved",
    tags: "Tags",
    sizes: "Sizes",
    roles: "Roles",
    component: "Component",
    supports: "Supports",
    version: "Version",
    pages: "Pages",
    renderKey: "Render Key",
    defaultDownload: "Default Download"
  }
};
var DAY_IN_SECONDS = 24 * 60 * 60;
var MINUTE_IN_SECONDS = 60;
var getAsset = async (asset, headOnly = false) => {
  const fullKey = `_assets/_xsl/${asset}.xsl`;
  return headOnly ? await headObject(fullKey) : await fromS3(fullKey);
};
var getCollection = async (collection, headOnly = false) => {
  const fullKey = `genie-tools/collections/${collection}.json`;
  return headOnly ? await headObject(fullKey) : await jsonFromS3(fullKey);
};
var assetSetting = async (assetKey, setting = null) => {
  let matches = {};
  try {
    const xsl = await getAsset(assetKey);
    if (typeof xsl !== "undefined") {
      const keys = !Array.isArray(setting) ? [setting] : setting;
      keys.forEach((key) => {
        switch (key) {
          case "size":
            const sizes = getFileData(xsl, {
              sizes: genieGlobals.ASSET_HEADERS.sizes
            }).sizes.split(",").map((s2) => s2.trim());
            const size = Array.isArray(sizes) && sizes.length ? sizes[0] : null;
            matches.size = (size ?? genieGlobals.DEFAULT_SIZE).trim();
            break;
          case "roles":
          case "pages":
          case "tags":
          case "sizes":
          case "supports":
            matches[key] = getFileData(xsl, {
              [key]: genieGlobals.ASSET_HEADERS[key]
            })[key]?.split(",").map((s2) => s2.trim());
            break;
          case "all":
            matches = getFileData(xsl, genieGlobals.ASSET_HEADERS);
            ["roles", "pages", "tags", "sizes", "supports"].forEach((key2) => {
              matches[key2] = matches[key2]?.split(",").map((s2) => s2.trim());
            });
            break;
          case "renderKey":
            const data = getFileData(xsl, { renderKey: "Render Key" });
            matches.renderKey = data.renderKey ?? assetKey;
            break;
          default:
            if (genieGlobals.ASSET_HEADERS[key]) {
              matches[key] = getFileData(xsl, {
                [key]: genieGlobals.ASSET_HEADERS[key]
              });
            }
            break;
        }
      });
    }
  } catch (e) {
    console.log("assetSetting err:", e);
  }
  return Object.keys(matches).length > 1 ? matches : matches[setting] ?? {};
};
var getFileData = (buffer, headers) => {
  let result = {};
  if (typeof buffer !== "undefined") {
    const KB_IN_BYTES = 1024;
    let fileData = buffer.slice(0, KB_IN_BYTES).toString("utf8") || "";
    fileData = fileData.replace(/\r/g, "\n");
    Object.keys(headers).forEach((key) => {
      const matches = fileData.match(
        new RegExp(
          "^(?:[ \\t]*<\\?php)?[ \\t\\/*#@]*" + escapeRegExp(headers[key]) + ":(.*)$",
          "mi"
        )
      );
      result[key] = matches && matches.length > 0 ? cleanComment(matches[1]) : null;
    });
  }
  return result;
};
var escapeRegExp = (str) => str.replace(/[.*+\-?^${}()|[\]\\]/g, "\\$&");
var cleanComment = (str) => str.replace(/\s*(?:\*\/|\?>).*/, "").trim();
var endOfLastMonth = () => {
  let date = /* @__PURE__ */ new Date();
  date.setHours(0, 0, 0, 0);
  date.setDate(0);
  return date.getTime() - MINUTE_IN_SECONDS * 1e3;
};
var getDimensions = (size = null) => {
  let dims;
  switch ((size ?? "").replaceAll(" ", "-").trim().toLowerCase()) {
    case "door-hanger":
      dims = [1275, 3300];
      break;
    case "ipad-landscape":
      dims = [2160, 1620];
      break;
    case "video":
      dims = [1980, 1020];
      break;
    case "facebookstory":
      dims = [1080, 1920];
      break;
    case "instagram-square":
      dims = [1080, 1080];
      break;
    case "instagram-ad":
      dims = [1080, 566];
      break;
    case "linkedin":
      dims = [736, 1104];
      break;
    case "pinterest":
      dims = [1200, 800];
      break;
    case "twitter":
      dims = [1200, 675];
      break;
    case "letter":
      dims = [1458, 1883];
      break;
    case "us-letter":
      dims = [850, 1100];
      break;
    case "a4":
      dims = [827, 1169];
      break;
    case "postcard":
      dims = [1100, 600];
      break;
    case "facebook-ad":
    case "facebook-post":
    case "facebook-video-ad":
      dims = [555, 555];
      break;
    case "instagram-story":
      dims = [1080, 1920];
      break;
    case "facebook":
    default:
      dims = [1200, 628];
      break;
  }
  return { width: dims[0], height: dims[1] };
};

// src/genieAI.js
var API_URL = process.env.GENIE_URL ?? "https://app.thegenie.ai/api/Data/";
var API_PASS = process.env.GENIE_PASS ?? "iLAE9k1P!fL3";
var API_USER = process.env.GENIE_USER ?? "genieApiHub2";
var API_AUTH = "Basic " + Buffer.from(`${API_USER}:${API_PASS}`).toString("base64");
var HOUR_IN_SECONDS = 60 * 60;
var CACHE_FOR = {
  GetAddressPredictions: HOUR_IN_SECONDS * 36,
  GetSavedSearches: HOUR_IN_SECONDS * 36
};
var AS_JSON = "application/json";
var impersonater = {};
var from_cache = async (key, endpoint) => {
  const since = /* @__PURE__ */ new Date();
  since.setSeconds(
    since.getSeconds() - (CACHE_FOR[endpoint.split("/")[0]] ?? HOUR_IN_SECONDS / 2)
  );
  return await jsonFromS3(`_cache/${key}`, since);
};
var to_cache = async (data, endpoint, key, timeout_hours = 4) => {
  const timeout = CACHE_FOR[endpoint.split("/")[0]] ?? timeout_hours;
  if (timeout > 0) {
    await toS3(`_cache/${key}`, Buffer.from(data), {
      genieCache: endpoint?.toString(),
      GenieExpireFile: "GenieCache",
      timeout
    });
  }
};
var cache_key = (endpoint, params, verb) => {
  const { userId, ...restParams } = params ?? {};
  const strParams = JSON.stringify(Object.entries(restParams));
  const hash = import_crypto.default.createHash("md5").update(`${endpoint}.${verb}.${strParams}`).digest("hex");
  const userIdPart = userId ? `${userId}-` : "";
  return `genie-${userIdPart}${hash}.json`;
};
var areaName = async (userId, areaId, skipCache = false) => await call_api("GetAreaName", { areaId, userId }, skipCache);
var areaStatisticsWithPrevious = async (userId, areaId, month_count, end_timestamp = null, skipCache = false) => {
  month_count = month_count ?? 12;
  return await call_api(
    "GetAreaStatisticsWithPreviousInterval",
    {
      areaId,
      userId,
      numberOfMonthsToLookBack: month_count,
      endDate: dateFormat(end_timestamp)
    },
    skipCache
  );
};
var areaStatisticsMonthly = async (userId, areaId, years, skipCache = false) => {
  years = years ?? 1;
  return await call_api(
    "GetAreaStatisticsSoldMonthly",
    {
      areaId,
      userId,
      years
    },
    skipCache
  );
};
var agentProperties = async (userId, includeOpenHouses, skipCache = false) => {
  includeOpenHouses = includeOpenHouses ?? false;
  const callback = (results) => {
    if (results.properties) {
      results.properties = [...new Set(results.properties)];
      const yearAgo = timeAgo({ year: -1 });
      results.properties = results.properties.filter(
        (p) => p.soldDate === null || DateTime.fromISO(p.soldDate) > yearAgo
      );
    }
    if (results.openHouses) {
      const threeMonthsAgo = timeAgo({ quarter: -1, seconds: -90 });
      results.openHouses = results.openHouses.filter(
        (p) => DateTime.fromISO(p.startDateUtc) > threeMonthsAgo
      );
    }
    return results;
  };
  return await call_api(
    "GetAgentProperties",
    { userId, includeOpenHouses },
    skipCache,
    "POST",
    callback
  );
};
var getAssessorProperty = async (property_id, agent_id, skipCache = false) => await call_api(
  "GetAssessorPropertyDetail",
  {
    PropertyId: property_id,
    userId: agent_id
  },
  skipCache
);
var getAssessorPropertiesDetail = async (address_id, skipCache = false) => await call_api(
  `GetAssessorPropertiesDetail/${address_id}`,
  null,
  skipCache
);
var getAreaBoundary = async (areaId, skipCache = false) => await call_api(`GetAreaBoundary/${areaId}`, null, skipCache, "POST");
var getListing = async (user_id, mls_number, mls_id, skipCache = false) => {
  mls_id = mls_id ?? -1;
  let listing;
  let endpoint;
  try {
    if (mls_id > -1) {
      endpoint = "GetUserMlsListing";
      const r = await call_api(
        endpoint,
        { mlsId: mls_id, mlsNumber: mls_number, userId: user_id },
        skipCache,
        "POST"
      );
      listing = r.listing ?? null;
      if (listing && r.preferredAreaId) {
        listing.preferredAreaId = r.preferredAreaId;
      }
    } else {
      endpoint = "GetListingByMlsNumber";
      const r = await call_api(
        endpoint,
        { mlsNumber: mls_number },
        skipCache,
        "POST"
      );
      listing = r?.listings[0] ?? null;
    }
    if (listing?.errorCode == 0) {
      return listing;
    }
  } catch (err) {
    throw new Error(
      `${endpoint} failed: ${err.toString()}. (${user_id},${mls_number},${mls_id})`
    );
  }
};
var mlsDisplaySettings = async (mls_id, skipCache = false) => await call_api(`GetMlsDisplaySettings/${mls_id}`, null, skipCache, "POST");
var mlsProperties = async (mlsGroupID, area_id, startDate = null, includeOpenHouses, skipCache = false) => {
  includeOpenHouses = includeOpenHouses ?? false;
  startDate = startDate ?? dateFormat(timeAgo({ months: -1 }));
  let r;
  try {
    r = await call_api(
      "GetMlsProperties",
      {
        mlsGroupID,
        areaID: area_id,
        startDate,
        includeOpenHouses
      },
      skipCache
    );
  } catch (err) {
    console.log("GetMlsProperties failed", err);
  }
  return r ? r?.properties ?? { success: false } : { success: false };
};
var openhouseByMlsNumber = async (mlsID, mlsNumber, skipCache = false) => await call_api("GetOpenHouseByMlsNumber", { mlsID, mlsNumber }, skipCache);
var getPropertyBoundary = async (mls_id, mls_number, fips, property_id, skipCache = false) => {
  const args = {};
  if (mls_id) {
    args["MlsID"] = mls_id;
  }
  if (mls_number) {
    args["MlsNumber"] = mls_number;
  }
  if (fips) {
    args["FIPS"] = fips;
  }
  if (property_id) {
    args["PropertyID"] = property_id;
  }
  return await call_api("GetPropertyBoundary", args, skipCache);
};
var propertySurroundingAreas = async (mls_number, mls_id, user_id, strFips, property_id, skipCache = false) => {
  const propertyID = property_id ?? -1;
  const fips = strFips ?? "";
  const r = await call_api(
    "GetPropertySurroundingAreas",
    {
      aspNetUserId: user_id,
      mlsID: mls_id,
      mlsNumber: mls_number,
      fips,
      propertyID
    },
    skipCache
  );
  return r.success && r.areas;
};
var getShortData = async (shortUrlDataId, token, agentId = null, skipLeadCreate = false) => {
  const r = await call_api(
    "GetShortUrlData",
    { shortUrlDataId, token },
    "POST"
  );
  if (r.data) {
    if (agentId && skipLeadCreate !== true) {
      const capture = r.data;
      capture.shortUrlDataId = shortUrlDataId;
      capture.trackingData = {
        utmSource: capture.utm_source ?? null,
        utmMedium: capture.utm_medium ?? null,
        utmCampaign: capture.utm_campaign ?? null,
        utmTerm: capture.utm_term ?? null,
        utmContent: capture.utm_content ?? null
      };
      delete capture.mlsId;
      delete capture.mlsNumber;
      delete capture.phoneNumbers;
      delete capture.emailAddresses;
      delete capture.inquiryType;
      delete capture.utm_source;
      delete capture.utm_medium;
      delete capture.utm_campaign;
      delete capture.utm_term;
      delete capture.utm_content;
      const lead = await createLead(agentId, capture);
      if (typeof lead == "object" && typeof lead.key !== "undefined") {
        r.data.genieLeadId = lead.key;
      }
    }
    r.data.salutation = [r.data.firstName, r.data.lastName].join(" ");
    return r.data;
  }
};
var getUser = async (user_id) => await call_api(`GetUserProfile/${user_id}`);
var getPropertyFromId = async (property_id, agent_id) => {
  const r = await getAssessorProperty(property_id, agent_id);
  if (r.hasProperty) {
    r.property.boundary = await getPropertyBoundary(
      null,
      null,
      r.property.fips,
      r.property.propertyID
    );
    return r.property;
  }
};
var createLead = async (userId, args) => {
  args.userId = userId;
  const r = await call_api("CreateNewLead", args, "POST");
  if (!r) {
    console.log("Failed to create new lead: ", r);
  }
  return r;
};
var updateLead = async (userId, args) => await call_api("UpdateLead", { ...args, userId }, "POST");
var getQRProperty = async (qrID, token) => {
  const lead = await getQRCodeLead(qrID, token);
  if (lead.property) {
    const property = lead.property;
    property.salutation = `${lead.firstName} ${lead.lastName}`;
    property.boundary = await getPropertyBoundary(
      null,
      null,
      property.fips,
      property.propertyID
    );
    const capture = {
      email: lead.email ?? null,
      phoneNumber: lead.phoneNumber ?? null,
      trackingData: lead.trackingData ?? null,
      qrCodeId: qrID,
      token
    };
    const leadCreate = await createQRCodeLead(capture);
    if (typeof leadCreate == "object" && leadCreate.success) {
      property.genieLeadId = leadCreate.key;
    }
    return property;
  }
};
var createQRCodeLead = async (args) => {
  const r = await call_api("CreateQRCodeLead", args, true, "POST");
  if (!r.success) {
    console.log("Failed to capture lead: ", r);
  }
  return r;
};
var getQRCodeLead = async (qrCodeId, token, skipCache = false) => await call_api(
  "GetQRCodeLead",
  { qrCodeId, token },
  skipCache,
  "POST"
);
var call_api = async (endpoint, params, skipCache = false, verb = "POST", pre_cache = null) => {
  params = params ?? {};
  if (impersonater.id) {
    params.ImpersonatedByAspNetUserId = impersonater.id;
  }
  const cacheKey = cache_key(endpoint, params, verb);
  let result;
  if (!skipCache) {
    result = await from_cache(cacheKey, endpoint);
  }
  if (!result) {
    if (endpoint.startsWith("GetUserProfile")) {
      console.log("ProfileGOT,", skipCache, params);
    }
    params.consumer = 8;
    result = await fetch(API_URL + endpoint, {
      method: verb,
      httpversion: "1.1",
      headers: {
        Authorization: API_AUTH,
        "cache-control": "no-cache",
        "content-type": AS_JSON,
        Accept: AS_JSON
      },
      timeout: 60,
      body: Object.keys(params).length > 0 ? JSON.stringify(params) : null
    }).then((response2) => {
      try {
        return response2.json();
      } catch (err) {
        throw new Error(`GenieAPI response not JSON: ${response2.body}`);
      }
    });
    if (result.success) {
      if (pre_cache && typeof pre_cache == "function") {
        result = pre_cache(result);
      }
      to_cache(JSON.stringify(result), endpoint, cacheKey);
    } else {
      if (typeof result !== "object" || !result?.responseDescription || result.responseDescription !== "Asset Url has already been set") {
        console.log(`GenieAPI error (${endpoint}): `, result);
      }
    }
  } else {
  }
  return result;
};

// src/index.js
var { toXML } = import_jstoxml.default;
var RENDER_VERSION = 100;
var JSON_MIME = "application/json";
var TXT_MIME = "text/plain";
var api = async (event) => {
  let routes = [], routeParams = [];
  let response2 = {
    statusCode: 200,
    body: { success: false },
    headers: {
      "Content-Type": "application/json"
    }
  };
  if (event.Records) {
    for (const record of event.Records) {
      if (record.eventSource == "aws:sqs") {
        switch (record.body) {
          case "clear-cache":
            let tempParams = {};
            routes.push("/clear-cache");
            Object.keys(record.messageAttributes).map((key) => {
              if ([
                "tags",
                "prefixes",
                "hosts",
                "renderId"
              ].includes(key)) {
                tempParams[key] = record.messageAttributes[key].dataType == "String" ? record.messageAttributes[key].stringValue : "";
              }
            });
            routeParams.push(tempParams);
            break;
          case "prepare":
            routes.push("/prepare");
            const processKey = `_processing/${record.messageAttributes.renderId.stringValue}/render.json`;
            let s3Params = await jsonFromS3(processKey);
            if (s3Params) {
              Object.keys(record.messageAttributes).map((key) => {
                if (key !== "renderId") {
                  if (key == "override") {
                    const override = JSON.parse(
                      record.messageAttributes["override"].stringValue
                    );
                    s3Params = {
                      ...s3Params,
                      ...override
                    };
                    if (override.areaId) {
                      s3Params.areaIds = [
                        override.areaId
                      ];
                    }
                  } else {
                    s3Params[key] = record.messageAttributes[key].dataType == "String" ? record.messageAttributes[key].stringValue : "";
                  }
                }
              });
              routeParams.push(s3Params);
            } else {
              console.log(`Failed to get ${processKey}`);
            }
            break;
          default:
            break;
        }
      } else if (record.eventSource == "aws:s3") {
        if (record.s3.object.key.endsWith("prep.json")) {
          routes.push("/process");
          let s3Params = await fromS3(record.s3.object.key).then(
            (buffer) => buffer && buffer.length > 0 ? JSON.parse(buffer) : null
          );
          routeParams.push({
            ...s3Params,
            sourceKey: record.s3.object.key
          });
        }
      }
    }
  } else if (event.rawPath) {
    routes.push(event.rawPath);
    if (event.queryStringParameters) {
      routeParams.push(event.queryStringParameters);
    } else {
      routeParams.push(JSON.parse(event.body ?? "{}"));
    }
  }
  for (let i = 0; i < routes.length; i++) {
    const route = routes[i];
    let params = routeParams[i];
    if (params) {
      try {
        if (params?.impersonaterId)
          impersonater.id = params.impersonaterId;
        if (route.startsWith("/genie-embed")) {
          response2.body = await embedsAPI(
            route.replace("/genie-embed/v2/", ""),
            params
          );
        } else if (route.startsWith("/genie-admin")) {
          response2.body = await cloudHubAPI(
            route.replace("/genie-admin/v2/", ""),
            params
          );
        } else {
          switch (route) {
            case "/build-version":
              response2.body = {
                buildVersion: await buildVersion()
              };
              break;
            case "/test":
              response2.body = await propertySurroundingAreas(
                params.mlsNumber,
                params.mlsId ?? 0,
                params.userId,
                null,
                null,
                true
              );
              break;
            case "/thumbnail":
              if (params.url) {
                if (params.width) {
                  params.width = parseInt(params.width);
                } else {
                  params.width = typeof params.height == "undefined" ? 300 : null;
                }
                if (typeof params.height != "undefined") {
                  params.height = parseInt(params.height);
                }
                const fallbackImageUrl = "https://genie-cloud.s3.us-west-1.amazonaws.com/_assets/_img/picture-pending.jpg";
                async function fetchAndProcessImage(url) {
                  const controller = new AbortController();
                  const timeoutId = setTimeout(() => controller.abort(), 3e3);
                  try {
                    const image = await fetch(url, { signal: controller.signal });
                    clearTimeout(timeoutId);
                    if (image.ok) {
                      const imageBuffer = await image.arrayBuffer();
                      const bytes = new Uint8Array(imageBuffer);
                      const imageStream = new import_stream2.Readable();
                      imageStream.push(bytes);
                      imageStream.push(null);
                      const resizedImage = imageStream.pipe(
                        (0, import_sharp.default)().resize({
                          width: params.width,
                          height: params.height
                        }).webp({
                          effort: 3,
                          quality: params.quality ?? 90
                        })
                      );
                      const resizedImageBuffer = await resizedImage.toBuffer();
                      return {
                        statusCode: 200,
                        headers: {
                          "Content-Type": "image/webp"
                        },
                        isBase64Encoded: true,
                        body: resizedImageBuffer.toString("base64")
                      };
                    } else {
                      throw new Error(`HTTP status ${image.status}`);
                    }
                  } catch (error2) {
                    if (url !== fallbackImageUrl) {
                      console.error(`Error fetching original image: ${error2.message}`);
                      return fetchAndProcessImage(fallbackImageUrl);
                    } else {
                      throw error2;
                    }
                  }
                }
                try {
                  response2 = await fetchAndProcessImage(params.url);
                } catch (error2) {
                  console.error(`Failed to fetch both original and fallback images: ${error2.message}`);
                  response2.body = {
                    success: false,
                    error: "Failed to fetch image"
                  };
                }
              } else {
                response2.body = {
                  success: false,
                  error: "`url` is a required parameter"
                };
              }
              break;
            case "/make-qrcode":
              const qr = await generateQR();
              response2.body = { success: true, ...qr };
              break;
            case "/log":
              if (params.renderId && params.assetId) {
                await toS3(
                  `genie-pages/${params.renderId}/${params.assetId}/access.json`,
                  Buffer.from(
                    JSON.stringify({ accessed: Date.now() })
                  ),
                  null,
                  JSON_MIME
                );
                const json = await jsonFromS3(
                  `_processing/${params.renderId}}/render.json`
                );
                if (json.mlsNumber) {
                  const updated = await mlsListingLastUpdate({
                    mlsId: json.mlsId,
                    mlsNumber: json.mlsNumber,
                    userId: json.userId
                  });
                }
                response2.body = {
                  success: true,
                  renderId: params.renderId
                };
              }
              break;
            case "/refresh-renders":
              let result = [];
              let isTruncated = true;
              let continuationToken = null;
              while (isTruncated) {
                const r = await listS3Folder(
                  "genie-pages",
                  false,
                  continuationToken
                );
                try {
                  await Promise.all(
                    r.Contents.map(async (item) => {
                      if (item.Key.endsWith("html")) {
                        const parts = item.Key.split("/");
                        const renderId = parts[1];
                        parts.pop();
                        const asset = parts.pop();
                        try {
                          const renderPath = `_processing/${renderId}/render.json`;
                          const renderExists = await headObject(
                            renderPath
                          );
                          if (renderExists?.ContentType == "application/json") {
                            try {
                              const p = {
                                asset: `landing-pages/${asset}`,
                                overrideKey: item.Key,
                                collection: null
                              };
                              result.push(p);
                              return await reRender(
                                renderId,
                                p
                              );
                            } catch {
                            }
                          }
                        } catch (err) {
                          console.log("fail", err);
                        }
                      }
                    })
                  );
                  isTruncated = r.IsTruncated;
                  continuationToken = r.NextContinuationToken;
                } catch (err) {
                  console.error("refresh Error", err);
                  break;
                }
              }
              response2.body = {
                disabled: false,
                renders: result
              };
              break;
            case "/re-render":
              if (params.renderId) {
                try {
                  const r = await reRender(params.renderId, {
                    ...params,
                    skipCache: true
                  });
                  if (r) {
                    await toS3(
                      `_lookup/re-render/${params.renderId}`,
                      Buffer.from("@"),
                      null,
                      TXT_MIME
                    );
                    response2.body.success = true;
                    response2.body.msg = `${params.renderId} re-render under way`;
                    if (Object.keys(params).length > 1) {
                      response2.body.msg += " (with override params)";
                    }
                  }
                  await queueMsg("clear-cache", {
                    renderId: {
                      DataType: "String",
                      StringValue: params.renderId
                    }
                  });
                } catch (err) {
                  response2.body.success = false;
                  response2.body.msg = `Error: ${err.message}`;
                }
              } else if (params.assetId || params.userId || params.mlsNumber || params.areaId) {
                let deletedCacheItems = 0;
                if (params.userId) {
                  try {
                    const cacheItems = await searchS3ByPrefix(`_cache/genie-${params.userId}`);
                    console.log(`Found ${cacheItems.length} cache items for user ${params.userId}`);
                    await Promise.all(
                      cacheItems.map(async (f) => {
                        if (f.Size > 0) {
                          try {
                            await deleteObject(f.Key);
                            deletedCacheItems++;
                          } catch (deleteError) {
                            console.error(`Error deleting object ${f.Key}:`, deleteError);
                          }
                        }
                      })
                    );
                    console.log(`Deleted ${deletedCacheItems} cache items for user ${params.userId}`);
                  } catch (cacheError) {
                    console.error("Error processing cache deletions:", cacheError);
                  }
                }
                try {
                  const processingItems = await searchS3ByPrefix("_processing", "render.json");
                  console.log(`Found ${processingItems.length} render.json files in _processing folder`);
                  const reRenders = await processBatch(processingItems, params);
                  console.log(`${reRenders.length} items matched the re-render criteria`);
                  if (reRenders.length > 0) {
                    const uniqueReRenders = [...new Set(reRenders)];
                    console.log(`${uniqueReRenders.length} unique items to be re-rendered`);
                    for (const renderId of uniqueReRenders) {
                      try {
                        await reRender(renderId, {
                          ...params,
                          skipCache: true
                        });
                        await toS3(
                          `_lookup/re-render/${renderId}`,
                          Buffer.from("@"),
                          null,
                          TXT_MIME
                        );
                      } catch (reRenderError) {
                        console.error(`Error during reRender for ${renderId}:`, reRenderError);
                      }
                    }
                    response2.body.success = true;
                    response2.body.msg = `${uniqueReRenders.length} re-renders underway. ${deletedCacheItems} cache items deleted.`;
                    response2.body.reRenders = uniqueReRenders;
                  } else {
                    response2.body.success = false;
                    response2.body.msg = "No items found to re-render";
                  }
                } catch (processingError) {
                  console.error("Error processing _processing folder:", processingError);
                  response2.body.success = false;
                  response2.body.msg = "Error during processing";
                }
                console.log(`Re-render process completed. Response: ${JSON.stringify(response2.body)}`);
              } else {
                throw new Error(
                  "[renderId] or [userId] or [mlsNumber] is required for a re-render"
                );
              }
              break;
            case "/process":
              if (params) {
                const r = await processAsset(params);
                if (r) {
                  let { sourceKey, ...reducedParams } = params;
                  await toS3(
                    sourceKey.replace("-prep.", "-xslt."),
                    Buffer.from(
                      JSON.stringify({
                        ...reducedParams,
                        ...r
                      })
                    ),
                    { "Genie-Delete": true },
                    JSON_MIME
                  );
                  await deleteObject(sourceKey);
                }
              }
              break;
            case "/prepare":
              if (params.collection) {
                const collection = await getCollection(
                  params.collection
                );
                if (collection) {
                  await prepareAsset(
                    `collections/${collection.template}`,
                    {
                      ...params,
                      asset: `collections/${collection.template}`,
                      size: "Landing Page",
                      isCollectionTemplate: true
                    }
                  );
                  await Promise.all(
                    collection.sections.map(
                      async (section) => {
                        await Promise.all(
                          section.assets.map(
                            async (asset) => {
                              let qrUrl = asset.qrUrl;
                              let qrDestination = asset.qrDestination;
                              if (!qrDestination && qrUrl) {
                                const lpoAsset = collection.sections.flatMap(
                                  (s2) => s2.assets
                                ).find(
                                  (asset2) => asset2.asset === `landing-pages/${qrUrl}`
                                );
                                if (lpoAsset && lpoAsset.lpo) {
                                  const destinationKey = await getS3Key(
                                    `${lpoAsset.lpo}/${qrUrl}/index.html`,
                                    {
                                      renderId: params.renderId
                                    }
                                  );
                                  qrDestination = `${genieGlobals.GENIE_HOST}${destinationKey.s3Key}`;
                                  qrUrl = null;
                                }
                              }
                              const assetParams = {
                                ...params,
                                asset: asset.asset,
                                size: asset.size,
                                lpo: asset.lpo,
                                qrDestination,
                                qrUrl
                              };
                              return await prepareAsset(
                                asset.asset,
                                assetParams
                              );
                            }
                          )
                        );
                      }
                    )
                  );
                }
              } else if (params.assets) {
                await Promise.all(
                  params.assets.map(async (asset) => {
                    return await prepareAsset(
                      asset,
                      params
                    );
                  })
                );
              } else {
                await prepareAsset(params.asset, params);
              }
              break;
            case "/cleanup-renders":
              try {
                const userId = params.userId;
                if (!userId) {
                  throw new Error("userId parameter is required");
                }
                console.log(`Starting cleanup of render.json files for user ${userId}`);
                const processRenderBatch = async (items, batchSize = 500) => {
                  let userAssets2 = {};
                  let filesToDelete2 = [];
                  for (let i2 = 0; i2 < items.length; i2 += batchSize) {
                    const batch = items.slice(i2, i2 + batchSize);
                    await Promise.all(
                      batch.map(async (item) => {
                        try {
                          const stream = await streamS3Object(item.Key);
                          let jsonString = "";
                          for await (const chunk of readStream(stream)) {
                            jsonString += chunk;
                          }
                          try {
                            const json = JSON.parse(jsonString);
                            if (json.userId === userId) {
                              if (!userAssets2[json.userId]) {
                                userAssets2[json.userId] = { assetCount: 0, assets: [] };
                              }
                              userAssets2[json.userId].assetCount++;
                              userAssets2[json.userId].assets.push(item.Key);
                              filesToDelete2.push(item.Key);
                            }
                          } catch (parseError) {
                            console.error(`Error parsing JSON for ${item.Key}:`, parseError);
                          }
                        } catch (streamError) {
                          console.error(`Error streaming object ${item.Key}:`, streamError);
                        }
                      })
                    );
                    console.log(`Processed batch ${i2 / batchSize + 1}`);
                  }
                  return { userAssets: userAssets2, filesToDelete: filesToDelete2 };
                };
                const renderJsonFiles = await searchS3ByPrefix("_processing", "render.json");
                console.log(`Found ${renderJsonFiles.length} render.json files`);
                const { userAssets, filesToDelete } = await processRenderBatch(renderJsonFiles);
                console.log(`Found ${filesToDelete.length} files to delete for user ${userId}`);
                let deletedCount = 0;
                for (const fileKey of filesToDelete) {
                  try {
                    await deleteObject(fileKey);
                    deletedCount++;
                  } catch (deleteError) {
                    console.error(`Error deleting ${fileKey}:`, deleteError);
                  }
                }
                const result2 = Object.entries(userAssets).map(([userId2, data]) => ({
                  userId: userId2,
                  assetCount: data.assetCount,
                  assets: data.assets
                }));
                response2.body = {
                  success: true,
                  message: `Cleanup complete for user ${userId}. ${deletedCount} files deleted.`,
                  userAssetsData: result2,
                  filesToDelete
                };
              } catch (error2) {
                console.error("Error in cleanup-renders:", error2);
                response2.body = {
                  success: false,
                  error: `Failed to cleanup render.json files: ${error2.message}`
                };
              }
              break;
            case "/inspect-renders":
              try {
                console.log("Starting inspection of render.json files");
                const processRenderBatch = async (items, batchSize = 500) => {
                  let userAssets2 = {};
                  for (let i2 = 0; i2 < items.length; i2 += batchSize) {
                    const batch = items.slice(i2, i2 + batchSize);
                    await Promise.all(
                      batch.map(async (item) => {
                        try {
                          const stream = await streamS3Object(item.Key);
                          let jsonString = "";
                          for await (const chunk of readStream(stream)) {
                            jsonString += chunk;
                          }
                          try {
                            const json = JSON.parse(jsonString);
                            if (json.userId) {
                              if (!userAssets2[json.userId]) {
                                userAssets2[json.userId] = { assetCount: 0, assets: [] };
                              }
                              userAssets2[json.userId].assetCount++;
                              userAssets2[json.userId].assets.push(item.Key);
                            }
                          } catch (parseError) {
                            console.error(`Error parsing JSON for ${item.Key}:`, parseError);
                          }
                        } catch (streamError) {
                          console.error(`Error streaming object ${item.Key}:`, streamError);
                        }
                      })
                    );
                    console.log(`Processed batch ${i2 / batchSize + 1}`);
                  }
                  return userAssets2;
                };
                const renderJsonFiles = await searchS3ByPrefix("_processing", "render.json");
                console.log(`Found ${renderJsonFiles.length} render.json files`);
                const userAssets = await processRenderBatch(renderJsonFiles);
                const result2 = Object.entries(userAssets).map(([userId, data]) => ({
                  userId,
                  assetCount: data.assetCount,
                  assets: data.assets
                })).filter((user) => user.assetCount >= 100).sort((a, b) => b.assetCount - a.assetCount);
                response2.body = {
                  success: true,
                  message: `Inspection complete. Processed ${renderJsonFiles.length} render.json files.`,
                  userAssetsData: result2,
                  totalUsersWithHighAssetCount: result2.length
                };
              } catch (error2) {
                console.error("Error in inspect-renders:", error2);
                response2.body = {
                  success: false,
                  error: `Failed to inspect render.json files: ${error2.message}`
                };
              }
              break;
            case "/create":
              try {
                console.log("Validating render params");
                await validateRenderParams(params);
                console.log("Render params validated");
                params.renderId = (0, import_crypto2.randomUUID)();
                params.theme = params.theme ?? await userSetting(
                  params.userId,
                  "theme"
                ) ?? "_default";
                ["light", "dark"].forEach((style) => {
                  if (params.theme.includes(`-${style}`)) {
                    params.theme = params.theme.replace(
                      `-${style}`,
                      ""
                    );
                    params.themeHue = style;
                  }
                });
                const { s3Key } = await getS3Key(
                  params.asset || params.assets && params.assets[0] || params.collection && "collection",
                  params
                );
                params.s3Key = s3Key;
                try {
                  params = await setRenderDefaults(params);
                } catch (error2) {
                  console.error("Error in setRenderDefaults:", error2);
                  throw error2;
                }
                response2.body.preCache = await preCallGenieAPIs(
                  params
                );
                const prepareKey = `_processing/${params.renderId}/render.json`;
                params = { ...params, version: RENDER_VERSION };
                await toS3(
                  prepareKey,
                  Buffer.from(JSON.stringify(params)),
                  { "Genie-Delete": "extended" },
                  JSON_MIME
                );
                if (params.collection || params.asset?.startsWith("landing-pages")) {
                  await copyObject(
                    "_assets/_reference/collection-rendering.html",
                    s3Key,
                    null,
                    "text/html",
                    "max-age=0"
                  );
                } else if (params.assets) {
                  const availableAt = [];
                  Promise.all(
                    params.assets.map(async (asset) => {
                      const assetS3Key = await getS3Key(
                        asset,
                        params
                      );
                      availableAt.push(assetS3Key);
                    })
                  );
                  response2.body.availableAt = availableAt;
                }
                await queueMsg("prepare", {
                  renderId: {
                    DataType: "String",
                    StringValue: params.renderId
                  }
                });
                let lookUpKeys = [
                  `renders`,
                  `users/${params.userId}`
                ];
                if (params.mlsNumber) {
                  lookUpKeys.push(
                    `mlsNumber/${params.mlsId}/${params.mlsNumber}`
                  );
                }
                if (params.areaIds) {
                  lookUpKeys = lookUpKeys.concat(
                    params.areaIds.map(
                      (areaId) => `areas/${areaId}`
                    )
                  );
                }
                Promise.all(
                  lookUpKeys.map(
                    async (key) => await toS3(
                      `_lookup/${key}/${params.renderId}`,
                      Buffer.from("@"),
                      null,
                      TXT_MIME
                    )
                  )
                );
                if (s3Key) {
                  response2.body.success = true;
                  response2.body.availableAt = response2.body.availableAt ?? // Allows earlier code to set custom version of this
                  `${params.isWorkFlow ? genieGlobals.GENIE_NO_CACHE_HOST : genieGlobals.GENIE_HOST}${s3Key.replace("/index.html", "")}`;
                  response2.body.reRender = `${genieGlobals.GENIE_API}re-render?renderId=${params.renderId}`;
                  response2.body.renderId = params.renderId;
                }
              } catch (e) {
                console.error("Error in /create route:", e);
                response2.body.error = e.message;
              }
              break;
          }
        }
      } catch (error2) {
        console.log("GenieAPI failed: ", error2);
        const currentDate = (/* @__PURE__ */ new Date()).toISOString().split("T")[0];
        if (params.renderId) {
          await toS3(
            `_errors/${currentDate}/${params.renderId}-${Date.now()}-api.json`,
            Buffer.from(
              JSON.stringify({
                params,
                error: error2.toString()
              })
            ),
            { GenieExpireFile: "error" },
            JSON_MIME
          );
        }
        response2.body.error = error2;
      } finally {
        if (!response2.isBase64Encoded) {
          response2.body = JSON.stringify(response2.body);
        }
      }
    }
  }
  return response2;
};
var processBatch = async (items, params, batchSize = 500) => {
  let reRenders = [];
  for (let i = 0; i < items.length; i += batchSize) {
    const batch = items.slice(i, i + batchSize);
    await Promise.all(
      batch.map(async (t) => {
        try {
          const stream = await streamS3Object(t.Key);
          let jsonString = "";
          for await (const chunk of readStream(stream)) {
            jsonString += chunk;
          }
          if (params.userId && !jsonString.includes(`"userId":"${params.userId}"`))
            return;
          if (params.mlsNumber && !jsonString.includes(`"mlsNumber":"${params.mlsNumber}"`))
            return;
          if (params.areaId && !jsonString.includes(`"areaIds":`))
            return;
          try {
            const json = JSON.parse(jsonString);
            if ((!params.userId || params.userId === json.userId) && (!params.mlsNumber || params.mlsNumber === json.mlsNumber) && (!params.areaId || json.areaIds.includes(params.areaId))) {
              reRenders.push(t.Key.split("/")[1]);
            }
          } catch (parseError) {
            console.error(`Error parsing JSON for ${t.Key}:`, parseError);
            console.error(`Problematic JSON string: ${jsonString}`);
          }
        } catch (streamError) {
          console.error(`Error streaming object ${t.Key}:`, streamError);
        }
      })
    );
    console.log(`Processed batch ${i / batchSize + 1}, total matches: ${reRenders.length}`);
  }
  return reRenders;
};
var renderKeyParams = async (params) => {
  let listing, areaId = params.area?.areaId ?? params.areaId, propertyType = 0, listingStatus = "";
  if (params.mlsNumber) {
    if (!params.propertyType || !params.listingStatus) {
      listing = await getListing(
        params.userId,
        params.mlsNumber,
        params.mlsId
      );
      if (!params.areaId && listing.preferedAreaId) {
        params.areaId = listing.preferedAreaId;
      }
    }
    if (!params.areaId) {
      const area2 = await areaFromMlsNumber(
        params.mlsNumber,
        params.mlsId,
        params.userId
      );
      if (area2) {
        areaId = area2.areaId;
      }
    }
    propertyType = params.propertyType ?? listing.propertyType;
    listingStatus = params.listingStatus ?? listing.listingStatus ?? "";
  }
  const area = await areaName(params.userId, areaId);
  return {
    reportDate: Math.round((/* @__PURE__ */ new Date()).getTime() / 1e3),
    areaName: area?.areaName ?? "unknown",
    propertyType,
    propertyCaption: params.propertyCaption ?? "",
    mlsNumber: params.mlsNumber ?? "",
    listingStatus
  };
};
var processAsset = async (params) => {
  const prepareKey = `_processing/${params.renderId}/render.json`;
  let s3Params = await jsonFromS3(prepareKey);
  if (s3Params) {
    const renderRoot = await getRenderJSON({ ...s3Params, ...params });
    return {
      transformXml: toXML(
        { renderRoot },
        {
          attributeFilter: (key, val) => val === null,
          attributeExplicitTrue: true,
          contentMap: (content) => {
            return content === null ? "" : content;
          }
        }
      ),
      transformXsl: (await fromS3(`_assets/_xsl/${params.asset}.xsl`)).toString().replaceAll(/[\t|\n]/g, " ")
    };
  } else {
    console.log(`processAsset failed for ${prepareKey}`);
  }
};
var prepareAsset = async (asset, params) => {
  const settings = await assetSetting(asset, "all");
  if (Object.keys(settings).length > 0) {
    let pages, suffix, dims, size;
    const { s3Key } = await getS3Key(asset, params);
    if (params.pages) {
      pages = params.pages;
      params.asPDF = params.asPDF ?? true;
    } else if (settings.pages && settings.pages !== "") {
      pages = settings.pages.map((s2) => ({ asset: s2 }));
    } else {
      pages = [{ asset: asset.trim() }];
    }
    if (settings.supports.includes("AsPDF")) {
      params.asPDF = true;
    }
    if (params.totalPages) {
      pages = pages.slice(0, params.totalPages + 1);
    }
    size = (params.size || Array.isArray(settings?.sizes) && settings.sizes[0] || genieGlobals.DEFAULT_SIZE).replaceAll(" ", "-").trim().toLowerCase();
    dims = getDimensions(size) ?? { width: 1200, height: 628 };
    switch (true) {
      case params.asPDF:
      case pages.length > 1:
        suffix = "pdf";
        break;
      case params.isCollectionTemplate:
      case params.isLandingPage:
        suffix = "html";
        break;
      case params.webp:
        suffix = "webp";
        break;
      case size == "video":
        suffix = "mp4";
        dims = { width: 1920, height: 1080 };
        break;
      default:
        suffix = "png";
    }
    await toS3(
      `_lookup/asset/${asset}/${params.renderId}`,
      Buffer.from("@"),
      null,
      TXT_MIME
    );
    await Promise.all(
      pages.map(async (p, i) => {
        const pageParams = {
          ...params,
          ...p,
          pageIndex: pages.length > 0 ? i + 1 : null,
          totalPages: pages.length > 0 ? pages.length + 1 : null,
          isSample: Boolean(params.isSample),
          size
        };
        pageParams.themeShade = pageParams.theme?.includes("dark") ? "Dark" : "Light";
        if (settings.permission) {
          const user = await getUser(params.userId);
          pageParams.isSample = !user.permissions.includes(
            settings.permission
          );
        }
        const isA5 = ["landing-pages", "funnels", "embeds"].find(
          (start) => asset.startsWith(start)
        );
        const withBleed = params?.withBleed ?? false;
        const width = suffix === "pdf" ? isA5 ? "216mm" : `${Math.round(dims.width) / 100 + (withBleed ? 0.25 : 0)}in` : Math.round(dims.width);
        const height = suffix === "pdf" ? isA5 ? "279mm" : `${Math.round(dims.height) / 100 + (withBleed ? 0.25 : 0)}in` : Math.round(dims.height);
        const render = {
          ...params,
          s3Key: params.overrideKey ?? s3Key,
          bucket: BUCKET,
          renderId: params.renderId,
          isDebug: params.isDebug,
          suffix,
          size,
          landscape: isA5 || dims.height < dims.width ? true : false,
          width,
          height,
          withBleed,
          dims,
          // required for the screen grab size
          scale: 1,
          // ToDo: some decision making
          cssPageSize: false,
          // ToDo: some decision making
          /*
              ToDo?
              render.clip
              render.clipX
              render.clipY
              render.clipWidth
              render.clipHeight
          */
          noPuppeteer: s3Key.endsWith("html"),
          isCollection: params.collection,
          // Flag for use by XSLT processor
          pageIndex: pageParams.pageIndex,
          totalPages: params.totalPages ?? pages.length,
          asset: pageParams.asset,
          tags: {
            asset: pageParams.asset,
            lpo: params.lpo
          }
        };
        let qrCodeSVGUrl;
        if (params?.qrDestination) {
          render.qrUrl = params.qrDestination;
          render.tags.qrDestination = params.qrDestination;
          if (!params.qrDestination.startsWith("http"))
            params.qrDestination = `https://${qrCodeSVGUrl}`;
          qrCodeSVGUrl = await getLandingQrCodeUrl(
            params?.parentAsset,
            params.renderId,
            params.qrDestination
          );
        } else if (params?.qrUrl) {
          render.tags.qrUrl = params.qrUrl;
          qrCodeSVGUrl = await getLandingQrCodeUrl(
            params.qrUrl,
            params.renderId
          );
        }
        if (qrCodeSVGUrl) {
          render.customizations = { qrCodeSVGUrl };
        }
        if (suffix === "mp4") {
          render.music = params.music ?? null;
          render.slideLength = params?.page?.slideLength ?? 5;
        }
        if (settings.defaultDownload && i == 0) {
          if (params.downloadUrl) {
            render.downloadUrl = params.downloadUrl;
          } else {
            let overrideKey = s3Key.replace(
              "index.html",
              `${(0, import_path.basename)(pageParams.asset)}-download.pdf`
            );
            render.downloadUrl = `/${overrideKey}`;
            const downloadSize = await assetSetting(
              settings.defaultDownload,
              "size"
            );
            await prepareAsset(settings.defaultDownload, {
              ...params,
              overrideKey,
              size: downloadSize,
              qrDestination: `${genieGlobals.GENIE_HOST}${render.s3Key.replace("/index.html", "")}`,
              parentAsset: pageParams.asset
            });
          }
        }
        const cleanKey = (0, import_path.basename)(render.s3Key).replaceAll(/[.\/#]|_/g, "-").replaceAll(/[^\w\s-]|_/g, "").replaceAll("--", "-");
        await toS3(
          `_processing/${params.renderId}/${cleanKey}${pageParams.asset.startsWith("landing-pages") ? `-${(0, import_path.basename)(pageParams.asset)}` : ""}-p${i}-prep.json`,
          Buffer.from(JSON.stringify(render)),
          { "Genie-Delete": true },
          JSON_MIME
        );
      })
    );
  }
};
var getPropertyCaption = (id, custom = null) => {
  if (custom)
    return custom;
  switch (id) {
    case 3:
      return "Condos";
    default:
      return "Homes";
  }
};
var reRender = async (renderId, params = null) => {
  const collectionExists = await headObject(
    `_processing/${renderId}/render.json`
  );
  if (collectionExists) {
    let msgAttrbs = {
      renderId: {
        DataType: "String",
        StringValue: renderId
      }
    };
    if (params.assetId) {
      msgAttrbs.assetId = {
        DataType: "String",
        StringValue: params.assetId
      };
    }
    if (params) {
      delete params.renderId;
      delete params.assetId;
      const override = JSON.stringify(params);
      if (override !== "{}") {
        msgAttrbs.override = {
          DataType: "String",
          StringValue: override
        };
      }
    }
    await queueMsg("prepare", msgAttrbs);
    return true;
  } else {
    throw new Error(`${renderId}: render data does not exist.`);
  }
};
var validateRenderParams = async (args) => {
  const errors = [];
  const msgs = [];
  try {
    if (!args.userId) {
      errors.push("[userId] is required");
    } else {
      let user = await getUser(args.userId);
      if (!user.emailAddress) {
        errors.push(`Genie User not found for "${args.userId}"`);
      }
    }
    if (!args.areaId && !args.mlsNumber) {
      errors.push("[areaId] or [mlsNumber] are required");
    }
    if (args.areaId && !args.ignoreBoundaryError) {
      let boundary = await getAreaBoundary(args.areaId);
      if ((boundary?.mapArea?.geoJSON ?? "").length > 2e5) {
        const errMsg = "Area boundary size risks render fail";
        if (!args.ignoreBoundaryFail) {
          errors.push(errMsg);
        } else {
          msgs.push(errMsg);
        }
      }
    }
    if (!args.asset && !args.collection && !args.pages && !args.assets) {
      errors.push(
        "One of [asset] or [collection] or [pages] or [assets] is required"
      );
    }
    if (args.asset) {
      let a;
      try {
        a = await getAsset(args.asset, true);
      } catch (e) {
        console.log("Validate getAsset failure:", e);
      }
      if (!a) {
        errors.push(`Asset '${args.asset}' does not exist`);
      } else {
        console.log(args, a);
      }
    }
    if (args.collection) {
      let c;
      try {
        c = await getCollection(args.collection, true);
      } catch (e) {
        console.log("Validate getCollection failure:", e);
      }
      if (!c) {
        errors.push(`Collection '${args.collection}' does not exist`);
      }
    }
  } catch (err) {
    console.log("Render validation error:", err);
  }
  if (errors.length > 0) {
    throw new Error(errors.join("; "));
  }
  return msgs;
};
var getLandingQrCodeUrl = async (asset, renderId, qrUrl = null) => {
  let landingS3Key;
  let s3Key = `genie-files/${renderId}/${asset}-qr.svg`;
  if (!qrUrl) {
    landingS3Key = await getS3Key(`landing-pages/${asset}`, { renderId });
  }
  const qrSVG = await generateQR(
    qrUrl ?? `${genieGlobals.GENIE_HOST}${landingS3Key.s3Key}`
  );
  await toS3(s3Key, Buffer.from(qrSVG), null, "image/svg+xml");
  return `${genieGlobals.GENIE_HOST}${s3Key}`;
};
var getS3Key = async (asset, params) => {
  let s3Key = `failed/${params.renderId}.png`;
  try {
    if (asset.startsWith("collection")) {
      s3Key = `genie-collection/${params.renderId}/index.html`;
    } else if (asset.endsWith("index.html")) {
      s3Key = `genie-pages/${params.renderId}/${asset}`;
    } else if (asset.startsWith("landing-pages")) {
      const base = typeof params.lpo !== "undefined" ? `${(0, import_path.basename)(params.lpo)}/${(0, import_path.basename)(asset)}` : (0, import_path.basename)(asset);
      s3Key = `genie-pages/${params.renderId}/${base}/index.html`;
    } else {
      const fileExtension = params?.asPDF ? "pdf" : params?.webp ? "webp" : null;
      const keyParams = await renderKeyParams(params);
      let { renderKey: renderKey2, pages } = await assetSetting(asset, [
        "renderKey",
        "pages"
      ]);
      const hasPages2 = params.pages || Array.isArray(pages) && pages.length > 0;
      const replaces = {
        REPORTDATE: DateTime.fromSeconds(keyParams.reportDate).toFormat(
          "LLL-yyyy"
        ),
        PROPTYPE: getPropertyCaption(
          keyParams.propertyType,
          keyParams.propertyCaption
        ),
        AREASLUG: keyParams.areaName.replace(
          /(-{2,}|\/|\s)+/g,
          (match2, p1) => p1 ? "-" : ""
        ),
        MLSNUMBER: keyParams.mlsNumber || "mls",
        LISTSTATUS: keyParams.listingStatus || "market"
      };
      renderKey2 = (0, import_path.basename)(renderKey2);
      Object.keys(replaces).map(
        (key) => renderKey2 = renderKey2.replace(key, replaces[key])
      );
      s3Key = `genie-files/${params.renderId}/${params.theme}/${renderKey2}.${fileExtension || hasPages2 && "pdf" || "png"}`;
    }
  } catch (error2) {
    await toS3(
      `_errors/${params.renderId}-${Date.now()}-api.json`,
      Buffer.from(
        JSON.stringify({
          params,
          error: error2.toString()
        })
      ),
      { GenieExpireFile: "error" },
      JSON_MIME
    );
  }
  return {
    s3Key,
    renderKey: typeof renderKey != "undefined" ? renderKey : null,
    hasPages: typeof hasPages != "undefined" ? hasPages : null
  };
};
// Annotate the CommonJS export names for ESM import in node:
0 && (module.exports = {
  JSON_MIME,
  TXT_MIME,
  api,
  getS3Key,
  validateRenderParams
});
