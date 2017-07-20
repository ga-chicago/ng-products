import { Component } from '@angular/core';
import {Http, Response} from '@angular/http';
import { Router } from '@angular/router'

class Raincoat{
  id: number;
  name: string;
  size: string;
  color: string;
  price: number;
  hooded: boolean;
  image_url: string;
}

@Component({
  selector: 'app-root',
  templateUrl: './list.component.html',
  styleUrls: ['./list.component.css']
})

export class ListComponent {
  raincoats: Raincoat[] = [];
  newRaincoat: Raincoat = new Raincoat();
  updateRaincoat: Raincoat = new Raincoat();
  showPostForm: boolean = false;
  showPatchForm: boolean = false;

  // method that runs when Class is initialized
  constructor(private http: Http, private router: Router){
    this.getRaincoats();
  }

  getRaincoats(){
    this.http.get('http://localhost:9393/raincoats/').subscribe(response =>
      this.raincoats = response.json()
    )
  }

  postRaincoat(){
    this.showPostForm = false
    this.http.post('http://localhost:9393/raincoats/', this.newRaincoat).subscribe(response =>
      this.raincoats = response.json()
    )
  }

  patchRaincoat(){
    this.showPatchForm = false
    this.http.patch('http://localhost:9393/raincoats/' + this.updateRaincoat.id, this.updateRaincoat).subscribe(response =>
      this.raincoats = response.json()
    )
  }

  deleteRaincoat(raincoat){
    this.http.delete('http://localhost:9393/raincoats/' + raincoat.id).subscribe(response =>
      this.raincoats = response.json()
    )
  }

  editRaincoat(raincoat){
    this.showPatchForm = true;
    this.updateRaincoat = Object.assign({},raincoat);
  }

  goToRaincoat(raincoat){
    this.router.navigate(['/raincoats/', raincoat.id])
  }
}
