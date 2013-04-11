// Generated by CoffeeScript 1.6.2
(function() {
  describe("rotor deck. setup - reflector A, rotor right - III, rotor middle - II, rotor left - I, initial position: AAA", function() {
    var reflector, rotorDeck, rotorLeft, rotorMiddle, rotorRight;

    reflector = null;
    rotorRight = null;
    rotorMiddle = null;
    rotorLeft = null;
    rotorDeck = null;
    beforeEach(function() {
      reflector = new Reflector(KnownReflectors.A);
      rotorRight = new Rotor(KnownRotors.III);
      rotorRight.setPosition("A");
      rotorMiddle = new Rotor(KnownRotors.II);
      rotorMiddle.setPosition("A");
      rotorLeft = new Rotor(KnownRotors.I);
      rotorLeft.setPosition("A");
      return rotorDeck = new RotorDeck(reflector, rotorLeft, rotorMiddle, rotorRight);
    });
    it('should return I, if A is passed', function() {
      var result;

      result = rotorDeck.encrypt("A");
      return expect(result).toBe("I");
    });
    it('should return A, if I is passed', function() {
      var result;

      result = rotorDeck.encrypt("I");
      return expect(result).toBe("A");
    });
    it('should return B, if F is passed', function() {
      var result;

      result = rotorDeck.encrypt("F");
      return expect(result).toBe("B");
    });
    return it('should return F, if B is passed', function() {
      var result;

      result = rotorDeck.encrypt("B");
      return expect(result).toBe("F");
    });
  });

  describe("rotor deck. setup - reflector A, rotor right - III, rotor middle - II, rotor left - I, initial position: AAB", function() {
    var reflector, rotorDeck, rotorLeft, rotorMiddle, rotorRight;

    reflector = null;
    rotorRight = null;
    rotorMiddle = null;
    rotorLeft = null;
    rotorDeck = null;
    beforeEach(function() {
      reflector = new Reflector(KnownReflectors.A);
      rotorRight = new Rotor(KnownRotors.III);
      rotorRight.setPosition("B");
      rotorMiddle = new Rotor(KnownRotors.II);
      rotorMiddle.setPosition("A");
      rotorLeft = new Rotor(KnownRotors.I);
      rotorLeft.setPosition("A");
      return rotorDeck = new RotorDeck(reflector, rotorLeft, rotorMiddle, rotorRight);
    });
    it('should return G, if A is passed', function() {
      var result;

      result = rotorDeck.encrypt("A");
      return expect(result).toBe("G");
    });
    return it('should return T, if B is passed', function() {
      var result;

      result = rotorDeck.encrypt("B");
      return expect(result).toBe("T");
    });
  });

  describe("rotor deck. moving rotors forward", function() {
    var reflector, rotorDeck, rotorLeft, rotorMiddle, rotorRight;

    reflector = null;
    rotorRight = null;
    rotorMiddle = null;
    rotorLeft = null;
    rotorDeck = null;
    beforeEach(function() {
      reflector = new Reflector(KnownReflectors.A);
      rotorRight = new Rotor(KnownRotors.III);
      rotorRight.setPosition("A");
      rotorMiddle = new Rotor(KnownRotors.II);
      rotorMiddle.setPosition("A");
      rotorLeft = new Rotor(KnownRotors.I);
      rotorLeft.setPosition("A");
      return rotorDeck = new RotorDeck(reflector, rotorLeft, rotorMiddle, rotorRight);
    });
    it('should return AAB, if AAA is passed', function() {
      var result;

      rotorDeck.advanceRotors;
      result = rotorDeck.rotorLeft.getPosition() + rotorDeck.rotorMiddle.getPosition() + rotorDeck.rotorRight.getPosition();
      return expect(result).toBe("AAB");
    });
    it('should return AAC, if AAB is passed', function() {
      var result;

      rotorDeck.rotorRight.setPosition("B");
      rotorDeck.advanceRotors;
      result = rotorDeck.rotorLeft.getPosition() + rotorDeck.rotorMiddle.getPosition() + rotorDeck.rotorRight.getPosition();
      return expect(result).toBe("AAC");
    });
    return it('should return AFR, if AEQ is passed', function() {
      var result;

      rotorDeck.rotorLeft.setPosition("A");
      rotorDeck.rotorMiddle.setPosition("E");
      rotorDeck.rotorRight.setPosition("Q");
      rotorDeck.advanceRotors;
      result = rotorDeck.rotorLeft.getPosition() + rotorDeck.rotorMiddle.getPosition() + rotorDeck.rotorRight.getPosition();
      return expect(result).toBe("AFR");
    });
  });

  describe("rotor deck. encrypting: achtung", function() {
    var reflector, rotorDeck, rotorLeft, rotorMiddle, rotorRight;

    reflector = null;
    rotorRight = null;
    rotorMiddle = null;
    rotorLeft = null;
    rotorDeck = null;
    beforeEach(function() {
      reflector = new Reflector(KnownReflectors.A);
      rotorRight = new Rotor(KnownRotors.III);
      rotorRight.setPosition("A");
      rotorMiddle = new Rotor(KnownRotors.II);
      rotorMiddle.setPosition("A");
      rotorLeft = new Rotor(KnownRotors.I);
      rotorLeft.setPosition("A");
      return rotorDeck = new RotorDeck(reflector, rotorLeft, rotorMiddle, rotorRight);
    });
    return it('should encrypt and decrypt: ACHTUNG', function() {
      var char, decryptedText, encrypt, encryptedText, word, _i, _j, _len, _len1, _ref, _ref1;

      encrypt = function(char) {
        var result;

        result = rotorDeck.encrypt(char);
        rotorDeck.advanceRotors;
        return result;
      };
      word = "ACHTUNG";
      encryptedText = '';
      _ref = word.split('');
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        char = _ref[_i];
        encryptedText += encrypt(char);
      }
      rotorRight.setPosition("A");
      rotorMiddle.setPosition("A");
      rotorLeft.setPosition("A");
      decryptedText = '';
      _ref1 = encryptedText.split('');
      for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
        char = _ref1[_j];
        decryptedText += encrypt(char);
      }
      return expect(word).toBe(decryptedText);
    });
  });

}).call(this);
