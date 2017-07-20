import { Component } from '@angular/core';
import {Http, Response } from '@angular/http'
import { Router } from '@angular/router'
@Component({
  selector: 'app-root',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})

export class LoginComponent {
  user = {};

  constructor(private http: Http, private router: Router){

  }

  login(){
    this.http.post('http://localhost:9393/users/login', this.user).subscribe(response =>
       this.router.navigate(['/list'])
    )
  }
}
