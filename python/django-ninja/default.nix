/*
This is called with:

  my-django-ninja = callPackage /path/to/this/default.nix {
      buildPythonPackage = python3Packages.buildPythonPackage;
  };

*/

{ lib, buildPythonPackage, python3 }:

  buildPythonPackage rec {
    pname = "django-ninja";
    format = "flit";
    version = "0.20.0";
    propagatedBuildInputs = [ python3.pkgs.pydantic python3.pkgs.django ];    
    src = python3.pkgs.fetchPypi {
      inherit pname version;
      sha256 = "b5af89955583de20031cb0a81b637a838f27822f3babb173253805306269ab79";
  };

  doCheck = false;

  meta = with lib; {
      homepage = "https://github.com/vitalik/django-ninja";
      description = "Fast, Async-ready, Openapi, type hints based framework for building APIs";
      license = licenses.mit;
      maintainers = with maintainers; [ vitalik ];
    };
  }
