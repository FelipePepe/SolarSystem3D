class Planet {
  float radius;
  float angle;
  float distance;

  float orbitspeed;
  Planet[] planets;

  PVector v;



  Planet(float r, float d, float o) {
    v = PVector.random3D();

    radius = r;
    angle = random(TWO_PI);
    distance = d;
    orbitspeed = o;
    v.mult(distance);
  }

  void show() {
    pushMatrix();
    noStroke();

    PVector v2 = new PVector(0, 0, 1);
    PVector p = v.cross(v2);
    
    rotate(angle, p.x, p.y, p.z);
    stroke(255);
    translate(v.x, v.y, v.z);
    noStroke();
    fill(255);
    sphere(radius);
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].show();
      }
    }
    popMatrix();
  }

  void spanMoons(int total, int level) {
    planets = new Planet[total];
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        float r = radius / (level * 2);
        float d = random((radius + r), (radius + r) * 2);
        float o = random(-0.05, 0.05);
        planets[i] = new Planet(r, d, o);
        if (level < 2) {
          int numMoon = int(random(0, 3));
          planets[i].spanMoons(numMoon, level + 1);
        }
      }
    }
  }

  void orbit() {
    angle = angle + orbitspeed;
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].orbit();
      }
    }
  }
}
