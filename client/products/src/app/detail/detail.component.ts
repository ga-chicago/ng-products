import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Http } from '@angular/http';

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
  selector: 'app-detail',
  templateUrl: './detail.component.html',
  styleUrls: ['./detail.component.css']
})
export class DetailComponent implements OnInit {
  raincoat: Raincoat = new Raincoat();

  constructor(private http: Http, private route: ActivatedRoute) {
    let id = this.route.snapshot.params;
    this.getRaincoat(id);
  }

  ngOnInit() {
  }

  getRaincoat(raincoat){
    this.http.get('http://localhost:9393/raincoats/' + raincoat.id).subscribe(response=>
      this.raincoat = response.json()
    )
  }

}
